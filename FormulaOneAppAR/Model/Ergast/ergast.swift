//
//  ergast.swift
//  FormulaOneAppAR
//
//  Created by MacOS on 4/5/2023.
//

import Foundation
struct Root: Codable {
    let MRData: MRData
}

struct MRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let standingsTable: StandingsTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }
}

struct StandingsTable: Codable {
    let season: String
    let standingsLists: [StandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

struct StandingsList: Codable {
    let season: String
    let round: String
    let constructorStandings: [ConstructorStanding]

    enum CodingKeys: String, CodingKey {
        case season, round
        case constructorStandings = "ConstructorStandings"
    }
}

struct ConstructorStanding: Codable {
    let position: String
    let positionText: String
    let points: String
    let wins: String
    let constructor: Constructor

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
    }
}

struct Constructor: Codable {
    let constructorId: String
    let url: String
    let name: String
    let nationality: String
}
struct Rrace : Codable,Hashable{
    var round: Int
    var date: String
    var city: String
    var country: String
    
    init(round: Int, date: String, city: String, country: String) {
        self.round = round
        self.date = date
        self.city = city
        self.country = country
    }
    enum CodingKeys: String, CodingKey {
        case round
        case date
        case city
        case country
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(round, forKey: .round)
        try container.encode(date, forKey: .date)
        try container.encode(city, forKey: .city)
        try container.encode(country, forKey: .country)
    }
}
var racess=[Rrace(round: 1, date: "March 5", city: "Sakhir", country: "Bahrain"),
    Rrace(round: 2, date: "March 19", city: "Jeddah", country: "Saudi Arabia"),
            Rrace(round: 6, date: "May 7", city: "Miami", country: "usa"),
            Rrace(round: 4, date: "April 16", city: "Shanghai", country: "China"),
            Rrace(round: 5, date: "April 30", city: "Azerbaijan", country: "Baku"),
            Rrace(round: 6, date: "May 7", city: "Miami", country: "USA"),
            Rrace(round: 7, date: "May 21", city: "Imola", country: "Italy"),
            Rrace(round: 8, date: "May 28", city: "Monte Carlo", country: "Monaco"),
            Rrace(round: 9, date: "June 4", city: "Barcelona", country: "Spain"),
            Rrace(round: 10, date: "June 18", city: "Montreal", country: "Canada"),
            Rrace(round: 11, date: "July 2", city: "Spielberg", country: "Austria"),
            Rrace(round: 12, date: "July 9", city: "England", country: "Great Britain"),
            Rrace(round: 13, date: "July 23", city: "Budapest", country: "Hungary"),
            Rrace(round: 14, date: "July 30", city: "Spa de Francorchamps", country: "Belgium"),
            Rrace(round: 15, date: "August 27", city: "Zandvoort", country: "Netherlands"),
            Rrace(round: 16, date: "September 3", city: "Monza", country: "Italy"),
            Rrace(round: 17, date: "September 17", city: "Marina Bay", country: "Singapore"),
            Rrace(round: 18, date: "September 24", city: "Suzuka", country: "Japan"),
            Rrace(round: 19, date: "October 8", city: "Qatar", country: "Qatar"),
            Rrace(round: 20, date: "October 22", city: "Austin", country: "USA"),
            Rrace(round: 21, date: "October 29", city: "Mexico City", country: "Mexico"),
            Rrace(round: 22, date: "November 5", city: "Sao Paolo", country: "Brazil"),
            Rrace(round: 23, date: "November 18", city: "Las Vegas", country: "USA"),
            Rrace(round: 24, date: "November 26", city: "Abu Dhabi", country: "UAE")]
/*let constructors = [ConstructorModel(logo: "logo_mercedes", carImage: "car_mercedes", rank: "1", point: "356", wins : "4",teamname: "Mercedess",modelname: "TeameDetailViewMercedess",base: "germany"),
                    ConstructorModel(constructorId:"1",logo: "ferrari_logo", carImage: "car_ferrari", rank: "2", point: "354", wins: "3", teamname: "Ferrari",modelname: "TeameDetailViewferrari",base: "italy"),
                    ConstructorModel(constructorId:"2",logo: "alpine", carImage: "alpine_car", rank: "4", point: "340",wins: "3" ,teamname: "Alpha",modelname: "TeameDetailViewAlpha", base: "Franch"),
                    ConstructorModel(constructorId:"2",logo: "haas", carImage: "haas_car", rank: "5", point: "290", wins: "3",teamname: "Hass",modelname: "TeameDetailViewHass", base: "Britsih"),
                    ConstructorModel(constructorId:"2",logo: "mclaren", carImage: "Mclaren_car", rank: "6", point: "270", wins: "3",teamname: "Mclaren",modelname: "TeameDetailViewmclaren", base: "British"),
                    ConstructorModel(constructorId:"2",logo: "renault", carImage: "renault_car", rank: "7", point: "210", wins: "3",teamname: "Renault",modelname: "TeameDetailViewrenault", base: "French"),
                    ConstructorModel(constructorId:"2",logo: "williams", carImage: "williams_car", rank: "8", point: "180", wins: "3",teamname: "Williams",modelname: "TeameDetailViewwilliams", base: "USA"),

]*/
