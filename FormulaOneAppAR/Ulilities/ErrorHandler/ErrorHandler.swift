//
//  ErrorHandler.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation
import SwiftUI
enum AuthenticationError: Error {
    case invalidCredentials
    case ivalidlogin
    case nodata
    case URLisnotcorrect
    case unknownError
    var localizedDescription: LocalizedStringKey {
        switch self {
        case .invalidCredentials:
            return LocalizedStringKey("InvalidCredentials")
        case .ivalidlogin:
            return LocalizedStringKey("UsernameOrPassordIncorrect")
        case .nodata:
            return LocalizedStringKey("NoData")
        case .URLisnotcorrect :
            return LocalizedStringKey("URLIsNotCorrect")
        case .unknownError:
            return LocalizedStringKey("AnUnknownErrorOccurredWhileRegisteringTheUser")
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

    var localizedDescription: LocalizedStringKey {
        switch self {
        case .emailAlreadyInUse:
            return LocalizedStringKey("TheEmailEddressIsAlreadyInUse")
        case .invalidPassword:
            return LocalizedStringKey("ThePasswordDoesNotMeetTheRequiredComplexityRules")
        case .lockedAccount:
            return LocalizedStringKey("TheAccountHasBeenLockedDueToSuspiciousActivity")
        case .missingRequiredFields:
            return LocalizedStringKey("OneOrMoreRequiredFieldsAreMissingOrIncomplete")
        case .networkError:
            return LocalizedStringKey("ThereWasAnErrorCommunicatingWithTheRegistrationService")
        case .unknownError:
            return LocalizedStringKey("AnUnknownErrorOccurredWhileRegisteringTheUser")
        case .URLisnotcorrect:
            return LocalizedStringKey("URLIsNotCorrect")
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
