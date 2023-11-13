//
//  PeopleViewModel.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import Foundation

class PeopleViewModel: ObservableObject{
    @Published private(set) var peoples: [PeopleResult]?
    
    func fetchPeoples() async{
        do{
            var urlRequest = URLRequest(url:URL(string: ApiConstants.people)!)
            urlRequest.httpMethod = "GET"
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("Response: \(response.description)")
            let decoder = JSONDecoder()
            let peopleResponse = try decoder.decode(PeopleResponse.self, from: data)
            
            DispatchQueue.main.async{
                self.peoples = peopleResponse.results
            }
        } catch{
            print("Error fetching and decoding data: \(error)")
        }
    }
}
