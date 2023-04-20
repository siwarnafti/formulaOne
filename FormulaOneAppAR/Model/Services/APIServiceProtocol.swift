//
//  APIServiceProtocol.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 14/4/2023.
//

import Foundation
protocol APIServiceProtocol {
    func fetchTeams(url: URL?, completion: @escaping(Result<[ConstructorModel], APIError>) -> Void)
}
