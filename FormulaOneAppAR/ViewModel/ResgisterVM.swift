//
//  ResgisterVM.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation
class ResgiterVM:ObservableObject{
    @Published var user = SignInUser()
    @Published var confirmPassword:String=""
    @Published var message:String=""
    @Published var invalid:Bool=false
    init(){}
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
                        self.confirmPasswordApi(user:self.user){
                            result in
                            print(result)
                        }
                        self.user.email=""
                        self.user.name=""
                        self.user.password=""
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
    func confirmPasswordApi(user:SignInUser, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           guard let url = URL(string: baseUrl+"user/SendConfirmEmail") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
        var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(ConfirmRequest(email: user.email))
           
           URLSession.shared.dataTask(with: request) { (data, response, error) in }.resume()
           
       }
    func logPressed() {
        print("Button pressed.")
    }
}
