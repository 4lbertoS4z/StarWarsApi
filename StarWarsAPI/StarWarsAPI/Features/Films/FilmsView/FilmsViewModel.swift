//
//  FilmsViewModel.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import Foundation

class FilmsViewModel: ObservableObject {
    @Published private(set) var films: [FilmResult]?
    
    func fetchFilms() async {
        do {
            var urlRequest = URLRequest(url: URL(string: ApiConstants.films)!)
            urlRequest.httpMethod = "GET"
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("Response: \(response.description)")
            let decoder = JSONDecoder()
            let filmResponse = try decoder.decode(FilmResponse.self, from: data)
            
            DispatchQueue.main.async{
                self.films = filmResponse.results
            }
        } catch {
            print("Error fetching and decoding data: \(error)")
        }
    }
}
