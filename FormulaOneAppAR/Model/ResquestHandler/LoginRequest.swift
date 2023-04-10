//
//  LoginResponse.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation

struct LoginRequest: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}
