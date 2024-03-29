//
//  forgotVM.swift
//  FormulaOneAppAR
//
//  Created by Apple Esprit on 11/4/2023.
//

import Foundation
import SwiftUI
class ForgotVM:ObservableObject{
    @Published var invalid: Bool = false
    @Published var isSent: Bool = false
    @Published var email:String = ""
    @Published var EmailError:LocalizedStringKey?=""
    @Published var message:LocalizedStringKey=""
    @Published var verificationcode:String=""
    @Published var verificationcodeError:LocalizedStringKey?
    @Published var password:String=""
    @Published var passwordError:LocalizedStringKey?
    @Published var confirmPassword:String=""
    @Published var confirmPasswordError:LocalizedStringKey?
   
    
    
    init(){
        
    }
//    func getuser()->UserForgotPassword?{
//           let defaults = UserDefaults.standard
//           if let savedUser = defaults.object(forKey: "user") as? Data {
//               let decoder = JSONDecoder()
//               if let loadedUser = try? decoder.decode(UserForgotPassword.self, from: savedUser) {
//                   // use loadedUser
//                   return loadedUser
//               }
//           }
//           return nil
//       }
    var isFormValid: Bool {
        return  EmailError == nil && passwordError == nil
    }
    func validatePassword() {
        if password.isEmpty {
            passwordError = LocalizedStringKey("PasswordIsRequired")
        } else if password.count < 8 {
            
            passwordError = LocalizedStringKey("PasswordMustBeAtLeast8characters")
        } else {
            passwordError = nil
        }
    }
    func validateverificationcode() {
        if verificationcode.isEmpty {
            verificationcodeError = LocalizedStringKey("VerificationCodeIsRequired")
        } else {
            verificationcodeError = nil
        }
    }
    func validateConfirmPassword() {
        if confirmPassword.isEmpty {
            confirmPasswordError = LocalizedStringKey("PasswordIsRequired")
        } else if password != confirmPassword {
            confirmPasswordError = LocalizedStringKey("PasswordsMustMatch")
        } else {
            confirmPasswordError = nil
        }
    }
    func logPressed() {
        print("Button pressed.")
    }
    func forgotpwd() {
        if(self.email.isEmpty){
            self.message = LocalizedStringKey("EmailIsRequired")
            self.invalid=true
        }else if(!(self.email.isValidEmail)){
            self.message = LocalizedStringKey("EmailIsInvalid")
            self.invalid=true
        }
        else
        {
            
            forgetPasswordApi(email:email){ result in
                
                switch result{
                case .success(_):
                    print(result)
                    //self.saveuser(user:self.user)
                    DispatchQueue.main.async {
                        self.isSent = true

                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.invalid=true
                        self.message = error.localizedDescription
                        print(error.localizedDescription)
                    }
                    
                }
                print(result)
            }
            self.message = LocalizedStringKey("CheckYourEmail")
            self.invalid=true
        }

    }
    
    func forgetPasswordApi(email:String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           
           guard let url = URL(string: baseUrl+"user/SendCodeForgot") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
        
           
        let body = ForgotRequest(email: self.email)
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
                        //let result = try JSONDecoder().decode(VerificationCodeResponse.self, from: data)
                        
                        completion(.success("verification sent"))}
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

    func confirmForgotPwd() {
        confirmForgetPasswordApi(codeForget:verificationcode,email:email,password:password){ result in
                
                switch result{
                case .success(_):
                    print(result)
                    //self.saveuser(user:self.user)
                    DispatchQueue.main.async {
                        self.isSent = true

                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.invalid=true
                        self.message = error.localizedDescription
                        print(error.localizedDescription)
                    }
                    
                }
                print(result)
            }
            self.message = LocalizedStringKey("PasswordChanged")
            self.invalid=true
        

    }
    
    func confirmForgetPasswordApi(codeForget:String,email:String,password:String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           
           guard let url = URL(string: baseUrl+"user/ChangePasswordForgot") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
        
           
        let body = UserForgotPassword(codeForget:self.verificationcode,email: self.email,password: self.password)
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
                completion(.success("verification sent"))
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
}
