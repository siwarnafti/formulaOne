//
//  ergastViewModel.swift
//  FormulaOneAppAR
//
//  Created by MacOS on 4/5/2023.
//

import Foundation
class ErgastViewModel:ObservableObject{
    
    @Published var arpp = APIServices()
    @Published var construcatorStanding = [ConstructorStanding]()
    
    let url = URL(string: "https://ergast.com/api/f1/2023/constructorStandings.json")
    
    init (){
        self.getConstructorStandings()
    }
    func getConstructorStandings(){
        arpp.fetchTeamsStandings(url: url){ [unowned self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    
                     print(error.description)
                    print(error)
                case .success(let teams):
                        //self.construcatorStanding=teams.MRData.standingsTable.standingsLists[0].constructorStandings
                    print(teams.MRData.standingsTable.standingsLists[0].constructorStandings[0])
                    //print("--- sucess with \(breeds.count)")
                    print("r")
                }
            }
        }
    }
}
