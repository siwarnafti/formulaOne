
import Foundation
import SwiftUI
class ViewModel: ObservableObject {
    @AppStorage("AUTH_KEY") var authenticated = false {
        willSet { objectWillChange.send() }
    }
    
    @Published var password=""
    @Published var invalid: Bool = false
    @Published var confirmPassword:String = ""
    @Published var message=""
    @Published var user=User()
    
    init() {
    }
    func logPressed() {
        print("Button pressed.")
    }
    func Changepassword() {
        print("Button pressed.")
    }
    func saveuser(user:User){
           let defaults = UserDefaults.standard
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(self.user) {
               defaults.set(encoded, forKey: "user")
           }
       }
    func getuser()->User?{
           let defaults = UserDefaults.standard
           if let savedUser = defaults.object(forKey: "user") as? Data {
               let decoder = JSONDecoder()
               if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                   // use loadedUser
                   return loadedUser
               }
           }
           return nil
       }
    func removeuser(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "user")
    }

    func forgotpwd() {
        if(self.user.email.isEmpty){
            self.message="Put your email"
            self.invalid=true
        }else if(!(self.user.email.isValidEmail)){
            self.message="not valid email "
            self.invalid=true
        }
        else
        {
            
            forgetPasswordApi(user:user){ result in
            
                print(result)
            }
            self.message="check your email  ✅"
            self.invalid=true
        }

    }
    
    func forgetPasswordApi(user:User, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           
           guard let url = URL(string: baseUrl+"user/SendCodeForgot") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
           
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(user)
           
           URLSession.shared.dataTask(with: request) { (data, response, error) in
             }.resume()
           
       }

       
}
extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}


