//
//  TeamsFetcher.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 14/4/2023.
//

import Foundation
class TeamsFetcher:ObservableObject{
    
    @Published var teams = [Team]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIServices()) {
        self.service = service
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: Ergasturl)
        service.fetchTeams(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let teams):
                    //print("--- sucess with \(breeds.count)")
                    self.teams = teams
                }
            }
        }
        
    }
}
