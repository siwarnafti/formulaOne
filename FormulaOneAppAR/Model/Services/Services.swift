//
//  Services.swift
//  login
//
//  Created by Siwar Nafti on 6/4/2023.
//

import Foundation
import Combine

//enum AuthenticationError: Error {
//    case invalidCredentials
//    case ivalidlogin
//    case nodata
//    case URLisnotcorrect
//    case unknownError
//    var localizedDescription: String {
//        switch self {
//        case .invalidCredentials:
//            return "invalidCredentials."
//        case .ivalidlogin:
//            return "username or passord incorrect."
//        case .nodata:
//            return "no Data."
//        case .URLisnotcorrect :
//            return "URL is not correct."
//        case .unknownError:
//            return "An unknown error occurred while registering the user."
//        }
//
//    }
//}
//enum RegistrationResultError: Error {
//    case emailAlreadyInUse
//    case invalidPassword
//    case lockedAccount
//    case missingRequiredFields
//    case networkError
//    case unknownError
//    case URLisnotcorrect
//
//    var localizedDescription: String {
//        switch self {
//        case .emailAlreadyInUse:
//            return "The email address is already in use."
//        case .invalidPassword:
//            return "The password does not meet the required complexity rules."
//        case .lockedAccount:
//            return "The account has been locked due to suspicious activity."
//        case .missingRequiredFields:
//            return "One or more required fields are missing or incomplete."
//        case .networkError:
//            return "There was an error communicating with the registration service."
//        case .unknownError:
//            return "An unknown error occurred while registering the user."
//        case .URLisnotcorrect:
//            return "URL is not correct."
//        }
//    }
//}
//
//enum NetworkError: Error {
//    case invalidURL
//    case noData
//    case decodingError
//}
//
//struct LoginRequestBody: Codable {
//    let email: String
//    let password: String
//}
//struct signupRequestBody: Codable {
//    let username:String
//    let email: String
//    let password: String
//}
//struct LoginResponse: Codable {
//    let token: String?
//    let message: String?
//    let success: Bool?
//}
//struct ForgotResponse: Codable {
//    let email: String
//}
//struct EditResponse: Codable {
//    let email: String
//    let username: String
//}

class Services {
//    @EnvironmentObject var user : User
    @Published var user = User()
//    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
//
//        guard let url = URL(string: "http://localhost:5001/api/user/signin") else {
//            completion(.failure(.URLisnotcorrect))
//            return
//        }
//
//        let body = LoginRequestBody(email: email, password: password)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(body)
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
////            guard let data = data, error == nil else {
////                completion(.failure(.nodata))
////                return
//
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                    // Handle invalid response
//                    return
//                }
//            print(httpResponse.statusCode)
//                switch httpResponse.statusCode {
//                case 200...299:
//                    let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data!)
//                    let token = loginResponse!.token
//                    completion(.success(token!))
//                case 422:
//                    completion(.failure(.ivalidlogin))
//                case 403...499:
//                    completion(.failure(.ivalidlogin))
//                    // Handle client error
//                case 500...599:
//                    completion(.failure(.unknownError))
//                    // Handle server error
//                default:
//                    completion(.failure(.invalidCredentials))
//                    // Handle unknown status code
//                }
//
//
//            //try! JSONDecoder().decode(LoginResponse.self, from: data)
//
//
//
//        }.resume()
//
//    }
//
//    func signup(username:String, email: String, password: String, completion: @escaping (Result<String, RegistrationResultError>) -> Void) {
//        
//        guard let url = URL(string: "http://localhost:5001/api/user/signup") else {
//            completion(.failure(.URLisnotcorrect))
//            return
//        }
//        
//        let body = signupRequestBody(username:username,email: email, password: password)
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(body)
//        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            
//            //print(response)
//            guard let httpResponse = response as? HTTPURLResponse else {
//                    // Handle invalid response
//                    return
//                }
//                switch httpResponse.statusCode {
//                case 202:
//                    completion(.success("singup done"))
//                case 402:
//                    completion(.failure(.emailAlreadyInUse))
//                case 403:
//                    completion(.failure(.invalidPassword))
//                case 404:
//                    completion(.failure(.missingRequiredFields))
//                case 500...599:
//                    completion(.failure(.networkError))
//                default:
//                    completion(.failure(.unknownError))
//                    // Handle unknown status code
//                }
//            
//        }.resume()
//        
//    }
    
//    func confirmPassword(username:String, email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
//        
//        guard let url = URL(string: "http://localhost:5001/api/user/SendConfirmEmail") else {
//            completion(.failure(.URLisnotcorrect))
//            return
//        }
//        
//        let body = signupRequestBody(username:username,email: email, password: password)
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(body)
//        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            
//            print("teb3ath")
//            
//        }.resume()
//        
//    }
//    func forgetPassword(email: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
//        
//        guard let url = URL(string: "http://localhost:5001/api/user/SendCodeForgot") else {
//            completion(.failure(.URLisnotcorrect))
//            return
//        }
//        
//        let body = ForgotResponse(email: email)
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(body)
//        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            
//            print("forgot teb3ath")
//            
//        }.resume()
//        
//    }
    
//    func updateprofil(username: String,email: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
//
//        guard let url = URL(string: "http://localhost:5001/api/user/EditProfil") else {
//            completion(.failure(.URLisnotcorrect))
//            return
//        }
//
//        let body = EditResponse(email: email, username: username)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(body)
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            print("forgot teb3ath")
//
//        }.resume()
//
//    }
//
    
}
