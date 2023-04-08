//
//  User.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import Foundation

class User:ObservableObject,Codable{
    
    @Published var username : String=""
    @Published var email: String=""
    @Published var password : String=""
init(){}
    enum CodingKeys: CodingKey{
        case username,email,password
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(username, forKey: .username)
        try container.encode(email, forKey: .email)

        try container.encode(password, forKey: .password)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        username = try container.decode(String.self, forKey: .username)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
    }
    

}

