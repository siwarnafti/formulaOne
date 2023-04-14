//
//  ErrorHandler.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation
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
