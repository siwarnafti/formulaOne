//
//  ergastViewModel.swift
//  FormulaOneAppAR
//
//  Created by MacOS on 4/5/2023.
//

import Foundation
class ErgastViewModel:ObservableObject{
    
    @Published var arpp = APIServices()
    @Published var construcators = [ConstructorModel]()
    
    let url = URL(string:baseUrl+"constructor/all")
    
    init (){
        getConstructors()
        print(construcators)
    }
    func getEvents() {
        self.fetchConstructors() { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let events):
                    self?.construcators = events
                    print(events)
                    
                case .failure(let error):
                    print("error loading movies: \(error)")
                }
            }
        }
    }
    func getConstructors(){
        arpp.fetchTeams(url: url){ result in
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("here")
                     print(error.description)
                    print(error)
                case .success(let teams):
                    self.construcators = teams
                    print(teams)
                }
            }
        }
    }
    
    func fetchConstructors( completion: @escaping(Result<[ConstructorModel],APIError>) -> Void) {
        let url = URL(string : baseUrl+"constructor/all")
//        createURL(for:   .movie, page: nil, limit: nil)
        fetche(type: [ConstructorModel].self, url: url, completion: completion)
    }

    func fetche<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {

        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error as? URLError {
                completion(Result.failure(APIError.unknown))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {

                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(.unknown))
                }
            }
        }.resume()
    }
}
