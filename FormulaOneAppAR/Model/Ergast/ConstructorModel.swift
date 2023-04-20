//
//  Team.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import Foundation
struct ConstructorModel: Codable {
    var constructorId: String
    var name: String
    var nationality: String
    var drivers: [DriverModel]
    
    enum CodingKeys: String, CodingKey {
        case constructorId
        case name
        case nationality
        case drivers
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(constructorId, forKey: .constructorId)
        try container.encode(name, forKey: .name)
        try container.encode(nationality, forKey: .nationality)
        try container.encode(drivers, forKey: .drivers)
    }
}

