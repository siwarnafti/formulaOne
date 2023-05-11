//
//  LoginVM.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation
import SwiftUI
class LogiVM:ObservableObject{
    @Published  var EmailError: LocalizedStringKey? = nil
    @Published  var passwordError: LocalizedStringKey? = nil
    @Published var credentials = Credentials()
    @Published var email:String=""
    @Published var password:String=""
    @Published var message:LocalizedStringKey=""
    @Published var invalid: Bool = false
    @Published var rememberMe: Bool = false
    @Published var loginbut:Bool=false
    @Published var isSnackbarShowing:Bool = false
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    @Published var storeCredentialsNext = false
    
    init(){}
var isFormValid: Bool {
        return  EmailError == nil && passwordError == nil
    }
    func authenticate() {
        if(self.credentials.password.isEmpty||self.credentials.email.isEmpty){
               self.message=LocalizedStringKey("AllFieldsMustBeFilled")
               self.invalid=true
        }else if(!(self.credentials.email.isValidEmail)){
               self.message=LocalizedStringKey("NotValidEmail")
               self.invalid=true
           }else{
               login()
           }
    }
    func validateEmail(){
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)

        if credentials.email.isEmpty {
            EmailError = LocalizedStringKey("EmailIsRequired")
//            return EmailError
        } else if !emailPredicate.evaluate(with: email) {
        
            EmailError = LocalizedStringKey("EmailIsInvalid")
//            return EmailError
        } else {
            EmailError = nil
//            return EmailError
        }
    }

    func validatePassword() {
        if credentials.password.isEmpty {
            passwordError = LocalizedStringKey("PasswordIsRequired")
        } else {
            passwordError = nil
        }
    }
    func login() {
        loginApi(credentials:credentials) { result in
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
    func loginApi(credentials: Credentials, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
    
        guard let url = URL(string: baseUrl+"user/signin") else {
        completion(.failure(.URLisnotcorrect))
        return
    }
//        let body = LoginRequestBody(credentials: credentials)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try? JSONEncoder().encode(credentials)
    
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
                    let result = try JSONDecoder().decode(LogedInUser.self, from: data)
                    if(self.rememberMe){
                        UserDefaults.standard.set(self.rememberMe, forKey: "RememberMe")
                        self.saveuser(user: result)
                        print(result)
                    }
                    if self.storeCredentialsNext {
                        if KeychainStorage.saveCredentials(credentials) {
                            DispatchQueue.main.async {
                                self.storeCredentialsNext = false
                            }
                        }
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
    func saveuser(user:LogedInUser){
           let defaults = UserDefaults.standard
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(user) {
               defaults.set(encoded, forKey: "user")
           }
       }
}
