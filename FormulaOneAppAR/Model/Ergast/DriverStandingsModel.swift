//
//  DriverStandingsModel.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 19/4/2023.
//

import Foundation
struct DriverStandingsModel {
    var position: Int
    var points: Double
    var driver: DriverModel
    var constructors: [ConstructorModel]
    func getconstructor()->ConstructorModel?{
        for constructor in self.constructors {
            for driver in constructor.drivers {
                if self.driver.driverId == driver.driverId{
                    return constructor
                }
            }
        }
        return nil
    }
}

