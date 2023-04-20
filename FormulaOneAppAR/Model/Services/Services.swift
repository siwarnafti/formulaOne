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

struct APIServices : APIServiceProtocol{
    //    @EnvironmentObject var user : User
    //@Published var user = User()
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }

            }
        }

        task.resume()
    }
    func fetchTeams(url: URL?, completion: @escaping(Result<[ConstructorModel], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let teams = try decoder.decode([ConstructorModel].self, from: data)
                    completion(Result.success(teams))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
                
                
            }
        }

        task.resume()
        
    }
}

