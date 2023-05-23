//
//  Team.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import Foundation
struct ConstructorModel: Decodable ,Hashable{
    
    var logo: String
    var carImage : String
    var rank :Int
    var point: String
    var wins:String
    var teamname: String
    var modelname: String?
    var base : String
    
    enum CodingKeys: String, CodingKey {
        
        case logo
        case carImage
        case rank
        case point
        case wins
        case teamname
        case modelname
        case base
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(logo, forKey: .logo)
        try container.encode(carImage, forKey: .carImage)
        try container.encode(rank, forKey: .rank)
        try container.encode(point, forKey: .point)
        try container.encode(wins, forKey: .wins)
        try container.encode(teamname, forKey: .teamname)
        try container.encode(modelname, forKey: .modelname)
        try container.encode(base, forKey: .base)

    }
}

/*var ConstructorModels = [ConstructorModel(constructorId:0,name: "Formula",modelName:"formulaOne.usdz"),
              ConstructorModel(constructorId:1,name: "Dice",modelName:"Dice.usdz"),ConstructorModel(constructorId:2,name: "ssangyoung",modelName:"ssangyoung.usdc")]
*/
