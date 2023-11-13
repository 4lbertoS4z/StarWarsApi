//
//  ShipsViewModel.swift
//  StarWarsAPI
//
//  Created by alberto saz on 13/11/23.
//

import Foundation

class ShipsViewModel: ObservableObject{
    @Published private(set) var ships:[StarshipResult]?
    
    func fetchShips() async{
        do{
            var urlRequest = URLRequest(url:URL(string:ApiConstants.starships)!)
            urlRequest.httpMethod = "GET"
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("Response: \(response.description)")
            let decoder = JSONDecoder()
            let shipsResponse = try decoder.decode(StarshipResponse.self, from: data)
            
            DispatchQueue.main.async{
                self.ships = shipsResponse.results
            }
        }catch{
            print("Error fetching and decoding data: \(error)")
        }
    }
    
}
