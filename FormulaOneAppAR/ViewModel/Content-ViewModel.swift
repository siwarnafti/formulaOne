
import Foundation
import SwiftUI
//import JWT
   class ViewModel: ObservableObject {
    @AppStorage("AUTH_KEY") var authenticated = false {
        willSet { objectWillChange.send() }
    }
    @AppStorage("USER_KEY") var username = ""
    @Published var email=""
    @Published var password = "" // Keep filled ONLY for debugging
    @Published var invalid: Bool = false
    @Published var confirmPassword:String = ""

    @Published var invalidlogin=false
    @Published var validforgot=false
       
//       @Published var id =
       @Published var message=""
       var services=Services()
//    @EnvironmentObject var user : User
    init() {
        // Debugging
       // print("Currently logged on: \(self.authenticated)")
       // print("Current user: \($user.username)")
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
           
           
           // Check for user
           //        guard self.username.isEmpty else {
           //            self.invalid = true
           //            return }
           //
           //        // Check for password
           //        guard self.password.isEmpty else {
           //            self.invalid = true
           //            return }
           //
           //        guard self.confirmPassword.isEmpty else {
           //            self.invalid = true
           //            return }
           //        guard self.email.isEmpty else {
           //            self.invalid = true
           //            return }
           //        guard self.password != self.confirmPassword else {
           //            self.invalid = true
           //            return }
           if(password.isEmpty||email.isEmpty){
               self.message="all fields must be filled"
               self.invalid=true
               
           }else if(!(self.email.isValidEmail)){
               self.message="not valid email "
               self.invalid=true
           }else{
               
               login()
               
           }}
    
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
        
        let defaults = UserDefaults.standard
        print("userhere: \(self.username)")
        services.login(email: self.email, password: self.password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "jsonwebtoken")
                defaults.setValue(self.email, forKey: "email")
                defaults.setValue(self.username, forKey: "username")
                //decodejwt(token: token)
                DispatchQueue.main.async {
                    self.authenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
       /*func decodejwt(token:String){
           

           let jwt = token
           let jwtParts = jwt.components(separatedBy: ".") // séparez le token en ses parties (header, payload, signature)

           // Décoder le payload
           let payloadData = Data(base64URLEncoded: jwtParts[1])!
           let payload = try JSONDecoder().decode(JWTPayload.self, from: payloadData)

           // Récupérer les informations d'identité
           let userId = payload["id"] as? String
           let username = payload["username"] as? String
           let email = payload["email"] as? String
           print(userId)

       }*/
    func signup() {
//        "Sign Up Successfully! ✅"
       // let defaults = UserDefaults.standard
        
        if(self.email.isEmpty||self.username.isEmpty||self.email.isEmpty||self.password.isEmpty||self.confirmPassword.isEmpty){
            self.message="all fields must be filled"
            self.invalid=true
            //print("1")
        }else if(self.password != self.confirmPassword){
            self.message="password must match"
            self.invalid=true
        }
        else
        {
            self.invalid=false
            services.signup(username: self.username,email: self.email, password: self.password) { result in
                //            switch result {
                //            case .success():
                //
                //            case .failure(let error):
                //                print(error.localizedDescription)
                //            }
                print(result)
            }
            services.confirmPassword(username: self.username,email: self.email, password: self.password){
                result in
                print(result)
            }
        }
    }
       func forgotpwd() {
           
          // let defaults = UserDefaults.standard
           //self.invalid=false
           if(self.email.isEmpty){
               self.message="Put your email"
               self.invalid=true
           }else if(!(self.email.isValidEmail)){
               self.message="not valid email "
               self.invalid=true
           }
           else
           {
               
               Services().forgetPassword(email: self.email){ result in
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
           
          // let defaults = UserDefaults.standard
//           self.invalid=false
          
           Services().updateprofil(username: self.username, email: self.email){ result in
    //               switch result {
    //                case .success():
                   self.message="check your email  ✅"
                        self.validforgot=true
                      
    //                case .failure():
    ////                   print(error.localizedDescription)
    //                   self.message="failed plz try again"
    //               }
                   //result.status
                   print(result)
               }
       }
    func signout() {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "jsonwebtoken")
        defaults.removeObject(forKey: "username")
        defaults.removeObject(forKey: "email")
        self.email=""
        self.username=""
        
        DispatchQueue.main.async {
            self.authenticated = false
        }
        
    }
}
extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}


