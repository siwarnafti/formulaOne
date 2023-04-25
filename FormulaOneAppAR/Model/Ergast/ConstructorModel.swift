//
//  Team.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import Foundation
struct ConstructorModel: Codable {
    var constructorId: Int
    var name: String
    var nationality: String?
    var modelName :String?
    var drivers: [DriverModel]?
    
    enum CodingKeys: String, CodingKey {
        case constructorId
        case name
        case nationality
        case modelName
        case drivers
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(constructorId, forKey: .constructorId)
        try container.encode(name, forKey: .name)
        try container.encode(nationality, forKey: .nationality)
        try container.encode(modelName, forKey: .modelName)
        try container.encode(drivers, forKey: .drivers)
    }
}

var ConstructorModels = [ConstructorModel(constructorId:0,name: "Formula",modelName:"formulaOne.usdz"),
              ConstructorModel(constructorId:1,name: "Dice",modelName:"Dice.usdz"),ConstructorModel(constructorId:2,name: "ssangyoung",modelName:"ssangyoung.usdc")]
