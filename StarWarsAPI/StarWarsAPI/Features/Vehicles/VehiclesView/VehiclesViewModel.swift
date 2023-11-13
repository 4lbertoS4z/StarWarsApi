//
//  VehiclesViewModel.swift
//  StarWarsAPI
//
//  Created by alberto saz on 13/11/23.
//

import Foundation

class VehiclesViewModel: ObservableObject{
    @Published private(set) var vehicles:[VehicleResult]?
    
    func fetchVehicles() async{
        do{
            var urlRequest = URLRequest(url:URL(string:ApiConstants.vehicles)!)
            urlRequest.httpMethod = "GET"
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("Response: \(response.description)")
            let decoder = JSONDecoder()
            let vehiclesResponse = try decoder.decode(VehiclesResponse.self, from: data)
            
            DispatchQueue.main.async{
                self.vehicles = vehiclesResponse.results
            }
        }catch{
            print("Error fetching and decoding data: \(error)")
        }
    }
    
}
