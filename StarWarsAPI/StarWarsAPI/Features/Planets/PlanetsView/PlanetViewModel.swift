import Foundation

class PlanetViewModel: ObservableObject {
    @Published private(set) var planet: PlanetResult?
    
    func fetchPlanetDetails(from urlString: String) async {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            let decoder = JSONDecoder()
            // Decodifica un solo planeta, no una lista de planetas.
            let planetDetail = try decoder.decode(PlanetResult.self, from: data)
            
            // Actualiza el planeta en el hilo principal.
            await MainActor.run {
                self.planet = planetDetail
            }
            
        } catch {
            print("Error fetching and decoding data: \(error)")
        }
    }
}
