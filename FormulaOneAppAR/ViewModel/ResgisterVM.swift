//
//  ResgisterVM.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation
class ResgiterVM:ObservableObject{
    @Published var user = SignInUser()
    @Published var usernameError:String? = nil
    @Published var emailError:String? = nil
    @Published var passwordError:String? = nil
    @Published var confirmPasswordError:String? = nil
    @Published var confirmPassword:String=""
    @Published var message:String=""
    @Published var invalid:Bool=false
    @Published var isSnackbarShowing:Bool=false
    
    init(){}
    var isFormValid: Bool {
        return usernameError == nil && emailError == nil && passwordError == nil
    }

    func validateUsername() {
        if user.name.isEmpty {
            usernameError = "Username is required"
        } else {
            usernameError = nil
        }
    }

    func validateEmail() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)

        if user.email.isEmpty {
            emailError = "Email is required"
        } else if !emailPredicate.evaluate(with: user.email) {
            emailError = "Email is invalid"
        } else {
            emailError = nil
        }
    }

    func validatePassword() {
        if user.password.isEmpty {
            passwordError = "Password is required"
        } else if user.password.count < 8 {
            passwordError = "Password must be at least 8 characters"
        } else {
            passwordError = nil
        }
    }
func validateConfirmPassword() {
    if self.confirmPassword.isEmpty {
        confirmPasswordError = "Password is required"
    } else if user.password != self.confirmPassword {
        confirmPasswordError = "Passwords must match"
    } else {
        confirmPasswordError = nil
    }
}

    func signup() {
        if(user.email.isEmpty||user.name.isEmpty||user.email.isEmpty||user.password.isEmpty||self.confirmPassword.isEmpty){
            self.message="all fields must be filled"
            self.invalid=true
        }else if(user.password != self.confirmPassword){
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
                        self.user.email=""
                        self.user.name=""
                        self.user.password=""
                        self.confirmPassword=""
                    }
                    self.validateAccount(email:self.user.email){
                        result in
                        print(result)
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
    func signupApi(user:SignInUser, completion: @escaping (Result<String, RegistrationResultError>) -> Void) {
           
           guard let url = URL(string: baseUrl+"user/signup") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
           
//           let body = signupRequestBody(name:user.name,email: user.email, password: self.password)
           
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(user)
           
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
    func validateAccount(email:String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           guard let url = URL(string: baseUrl+"user/SendConfirmEmail") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
        var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(ConfirmRequest(email: email))
           
           URLSession.shared.dataTask(with: request) { (data, response, error) in }.resume()
           
       }
    func logPressed() {
        print("Button pressed.")
    }
}
