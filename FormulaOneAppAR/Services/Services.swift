//
//  Services.swift
//  login
//
//  Created by Siwar Nafti on 6/4/2023.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
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
    let username:String
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
    let username: String
}

class Services {
//    @EnvironmentObject var user : User
    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:5001/api/user/signin") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            try! JSONDecoder().decode(LoginResponse.self, from: data)
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            print(loginResponse)
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
        }.resume()
        
    }
    
    func signup(username:String, email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:5001/api/user/signup") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = signupRequestBody(username:username,email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            print(response)
            
        }.resume()
        
    }
    
    func confirmPassword(username:String, email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:5001/api/user/SendConfirmEmail") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = signupRequestBody(username:username,email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            print("teb3ath")
            
        }.resume()
        
    }
    func forgetPassword(email: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:5001/api/user/SendCodeForgot") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = ForgotResponse(email: email)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            print("forgot teb3ath")
            
        }.resume()
        
    }
    
    func updateprofil(username: String,email: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:5001/api/user/EditProfil") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = EditResponse(email: email, username: username)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            print("forgot teb3ath")
            
        }.resume()
        
    }
    
    
}
