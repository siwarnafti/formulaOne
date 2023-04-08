
import Foundation
import SwiftUI
enum AuthenticationError: Error {
    case invalidCredentials
    case ivalidlogin
    case nodata
    case URLisnotcorrect
    case unknownError
    var localizedDescription: String {
        switch self {
        case .invalidCredentials:
            return "invalidCredentials."
        case .ivalidlogin:
            return "username or passord incorrect."
        case .nodata:
            return "no Data."
        case .URLisnotcorrect :
            return "URL is not correct."
        case .unknownError:
            return "An unknown error occurred while registering the user."
        }
        
    }
}
enum RegistrationResultError: Error {
    case emailAlreadyInUse
    case invalidPassword
    case lockedAccount
    case missingRequiredFields
    case networkError
    case unknownError
    case URLisnotcorrect

    var localizedDescription: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email address is already in use."
        case .invalidPassword:
            return "The password does not meet the required complexity rules."
        case .lockedAccount:
            return "The account has been locked due to suspicious activity."
        case .missingRequiredFields:
            return "One or more required fields are missing or incomplete."
        case .networkError:
            return "There was an error communicating with the registration service."
        case .unknownError:
            return "An unknown error occurred while registering the user."
        case .URLisnotcorrect:
            return "URL is not correct."
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}
struct signupRequestBody: Codable {
    let name:String
    let email: String
    let password: String
}
struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}
struct ForgotResponse: Codable {
    let email: String
}
struct EditResponse: Codable {
    let email: String
    let name: String
}

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
       
    func toggleAuthentication() {
        // Make sure that the password does not save.
       // $user.password=""
//        self.confirmPassword = ""
//

//        withAnimation(.spring()) {
//            authenticated.toggle()
//        }
    }
    
    func authenticate() {
        if(self.password.isEmpty||self.user.email.isEmpty){
               self.message="all fields must be filled"
               self.invalid=true
        }else if(!(self.user.email.isValidEmail)){
               self.message="not valid email "
               self.invalid=true
           }else{
               login()
           }
    }
    
    func logOut() {
        toggleAuthentication()
    }
    
    func logPressed() {
        print("Button pressed.")
    }
    func Changepassword() {
        print("Button pressed.")
    }
    
    
    func login() {
        loginApi(user:user) { result in
            switch result {
            case .success(_):
                self.saveuser(user:self.user)
                DispatchQueue.main.async {
                    self.authenticated = true
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.invalid=true
                    self.message = error.localizedDescription
                    print(error.localizedDescription)
                }
            }
        }
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
    func signup() {
        if(user.email.isEmpty||user.name.isEmpty||user.email.isEmpty||self.password.isEmpty||self.confirmPassword.isEmpty){
            self.message="all fields must be filled"
            self.invalid=true
        }else if(self.password != self.confirmPassword){
            self.message="password must match"
            self.invalid=true
        }
        else
            {
            signupApi(user:user) { result in
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.invalid=true
                        self.message="Sign Up Successfully! ✅"
                        self.confirmPasswordApi(user:self.user){
                            result in
                            print(result)
                        }
                        self.user.email=""
                        self.user.name=""
                        self.password=""
                        self.confirmPassword=""
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async{
                        self.invalid=true
                        self.message=error.localizedDescription
                        print(result)
                        
                    }
                }
                
            }
        }
        
    }
    func forgotpwd() {
        
        // let defaults = UserDefaults.standard
        //self.invalid=false
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
                //               switch result {
                //                case .success():
                
                
                
                //                case .failure():
                ////                   print(error.localizedDescription)
                //                   self.message="failed plz try again"
                //               }
                //result.status
                print(result)
            }
            self.message="check your email  ✅"
            self.invalid=true
            
            
            
        }
        
//           Services().confirmPassword(username: self.username,email: self.email, password: self.password){
//               result in
//               print(result)
//           }
    }
    func updateprofil(email:String,username:String) {
        updateprofilApi(user:user){ result in
//               switch result {
//                case .success():
                self.message="check your email  ✅"
                    self.invalid=true
                    
//                case .failure():
////                   print(error.localizedDescription)
//                   self.message="failed plz try again"
//               }
                //result.status
                print(result)
            }
    }
    func signout() {
        
        self.removeuser()
        user=User()
        
        DispatchQueue.main.async {
            self.authenticated = false
        }
        
    }
    func loginApi(user:User, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
    
    guard let url = URL(string: "http://localhost:5001/api/user/signin") else {
        completion(.failure(.URLisnotcorrect))
        return
    }
    let body = LoginRequestBody(email: user.email, password: self.password)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse else {
                        return
                    }
        switch httpResponse.statusCode {
        case 200...299:
            if(error != nil) {
                return
            }
            do {
                if let data=data {
                    let result = try JSONDecoder().decode(User.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                        
                    }
                    completion(.success(result.token))}
                else{
                    print("no data")
                }
            }catch let jsonerror {
                print(jsonerror)
            }
        case 422:
            completion(.failure(.ivalidlogin))
        case 403...499:
            completion(.failure(.ivalidlogin))
            // Handle client error
        case 500...599:
            completion(.failure(.unknownError))
            // Handle server error
        default:
            completion(.failure(.invalidCredentials))
        }
    }.resume()
}
    func signupApi(user:User, completion: @escaping (Result<String, RegistrationResultError>) -> Void) {
           
           guard let url = URL(string: "http://localhost:5001/api/user/signup") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
           
           let body = signupRequestBody(name:user.name,email: user.email, password: self.password)
           
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(body)
           
           URLSession.shared.dataTask(with: request) { (data, response, error) in
               
               //print(response)
               guard let httpResponse = response as? HTTPURLResponse else {
                       // Handle invalid response
                       return
                   }
                   switch httpResponse.statusCode {
                   case 202:
                       completion(.success("singup done"))
                   case 402:
                       completion(.failure(.emailAlreadyInUse))
                   case 403:
                       completion(.failure(.invalidPassword))
                   case 404:
                       print(httpResponse.statusCode)
                       completion(.failure(.missingRequiredFields))
                   case 500...599:
                       completion(.failure(.networkError))
                   default:
                       completion(.failure(.unknownError))
                       // Handle unknown status code
                   }
               
           }.resume()
           
       }
    func confirmPasswordApi(user:User, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           
           guard let url = URL(string: "http://localhost:5001/api/user/SendConfirmEmail") else {
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
    func forgetPasswordApi(user:User, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           
           guard let url = URL(string: "http://localhost:5001/api/user/SendCodeForgot") else {
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
    func updateprofilApi(user:User, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           
           guard let url = URL(string: "http://localhost:5001/api/user/EditProfil") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
           
//           let body = EditResponse(email: email, username: username)
           
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(user)
           
           URLSession.shared.dataTask(with: request) { (data, response, error) in
               
               print("edit teb3ath")
               
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


