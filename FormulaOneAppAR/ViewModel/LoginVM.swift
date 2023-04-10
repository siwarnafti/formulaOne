//
//  LoginVM.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation
import SwiftUI
class LogiVM:ObservableObject{
    @Published  var EmailError: String = ""
    @Published  var passwordError: String = ""
    
    @Published var email:String=""
    @Published var password:String=""
    @Published var message=""
    @Published var invalid: Bool = false
    @Published var rememberMe: Bool = false
    @Published var loginbut:Bool=false
    init(){}
    func authenticate() {
        if(self.password.isEmpty||self.email.isEmpty){
               self.message="all fields must be filled"
               self.invalid=true
        }else if(!(self.email.isValidEmail)){
               self.message="not valid email "
               self.invalid=true
           }else{
               login()
           }
    }
    func login() {
        loginApi(email: self.email, password: self.password) { result in
            switch result {
            case .success(_):
                print(result)
                //self.saveuser(user:self.user)
                DispatchQueue.main.async {
                    self.loginbut = true

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
    func loginApi(email: String, password:String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
    
        guard let url = URL(string: baseUrl+"user/signin") else {
        completion(.failure(.URLisnotcorrect))
        return
    }
    let body = LoginRequestBody(email: email, password: password)
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
                    if(self.rememberMe){
                        UserDefaults.standard.set(self.rememberMe, forKey: "RememberMe")
                        self.saveuser(user: result)
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
    func saveuser(user:User){
           let defaults = UserDefaults.standard
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(user) {
               defaults.set(encoded, forKey: "user")
           }
       }
}
