//
//  signupRequestBody.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation

struct signupRequestBody: Codable {
    let name:String
    let email: String
    let password: String
}
