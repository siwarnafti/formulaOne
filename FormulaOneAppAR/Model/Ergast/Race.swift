//
//  Race.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 19/4/2023.
//

import Foundation
struct Race: Codable,Hashable {
    //var id : String = UUID().uuidString
    let name: String?
    let date: String?
    let year: Int?
    let round: Int?
    let url: String?
    let circuitId: Int?
    let raceId: Int?
    let time: String?
    
}

let  Race1 = Race(name: "Australian Grand ", date: "2009-03-29", year: 2023, round: 1, url: "http://en.wikipedia.org/wiki/2009_Australian_Grand_Prix", circuitId: 1, raceId: 1, time:"06:00:00" )
let  Race2 = Race(name: "Malaysian Grand ", date: "2009-03-29", year: 2023, round: 2, url: "http://en.wikipedia.org/wiki/2009_Australian_Grand_Prix", circuitId: 2, raceId: 2, time:"06:00:00" )
let  Race3 = Race(name: "USA", date: "2009-03-29", year: 2023, round: 3, url: "http://en.wikipedia.org/wiki/2009_Australian_Grand_Prix", circuitId: 3, raceId: 3, time:"06:00:00" )
let  Race4 = Race(name: "Australian  ", date: "2009-03-29", year: 2023, round: 4, url: "http://en.wikipedia.org/wiki/2009_Australian_Grand_Prix", circuitId: 4, raceId: 4, time:"06:00:00" )

let races = [Race1,Race2,Race3,Race4]
