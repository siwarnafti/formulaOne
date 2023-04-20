//
//  DriverModel.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 19/4/2023.
//

import Foundation
struct DriverModel : Codable{
    var driverId: String
    var image: DriverImageModel
    var givenName: String
    var familyName: String
    var nationality: String
    var permanentNumber: Int
    var code: String
    var dateOfBirth: String
}

// Object 1
let driver1 = DriverModel(driverId: "1", image: DriverImageModel(front: "front1", side: "side1"), givenName: "John", familyName: "Doe", nationality: "American", permanentNumber: 7, code: "JDO", dateOfBirth: "01-01-1990")
//let constructor1 = ConstructorModel(constructorId: "1", position: 1, name: "Mercedes", nationality: "German", points: 100.5, wins: 5, color: "Silver", drivers: [driver1])
//let driverStandings1 = DriverStandingsModel(position: 1, points: 120.5, driver: driver1, constructors: [constructor1])

// Object 2
let driver2 = DriverModel(driverId: "2", image: DriverImageModel(front: "front2", side: "side2"), givenName: "Lewis", familyName: "Hamilton", nationality: "British", permanentNumber: 44, code: "HAM", dateOfBirth: "07-01-1985")
//let constructor2 = ConstructorModel(constructorId: "2", position: 2, name: "Red Bull Racing", nationality: "Austrian", points: 90.0, wins: 3, color: "Red Bull", drivers: [driver2])
//let driverStandings2 = DriverStandingsModel(position: 2, points: 95.0, driver: driver2, constructors: [constructor2])

// Object 3
let driver3 = DriverModel(driverId: "3", image: DriverImageModel(front: "front3", side: "side3"), givenName: "Max", familyName: "Verstappen", nationality: "Dutch", permanentNumber: 33, code: "VER", dateOfBirth: "09-30-1997")
//let constructor3 = ConstructorModel(constructorId: "3", position: 3, name: "McLaren", nationality: "British", points: 70.0, wins: 1, color: "Orange", drivers: [driver3])
//let driverStandings3 = DriverStandingsModel(position: 3, points: 85.0, driver: driver3, constructors: [constructor3])

let drivers=[driver1,driver2,driver3]
//let constructorsn=[driverStandings1,driverStandings2,driverStandings2]
