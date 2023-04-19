//
//  results.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 19/4/2023.
//

import Foundation
struct Results: Codable,Hashable {
    let resultId: Int?
    let raceId: Int?
    let driverId: Int?
    let constructorId: Int?
    let number: Int?
}

let  results1 = Results(resultId: 1, raceId: 1, driverId: 1, constructorId: 1, number: 1)
let results2 = Results(resultId: 2, raceId: 2, driverId: 2, constructorId: 2, number: 2)
let  results3 = Results(resultId: 3, raceId: 3, driverId: 3, constructorId: 3, number: 3)
let  results4 = Results(resultId: 4, raceId: 4, driverId: 4, constructorId: 4, number: 4)

let result=[results1,results2,results3,results4]


