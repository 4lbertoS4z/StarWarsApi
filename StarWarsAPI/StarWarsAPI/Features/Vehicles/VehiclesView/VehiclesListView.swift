import SwiftUI

struct VehiclesListView: View {
    
    @StateObject private var vehicleViewModel = VehiclesViewModel()
    @StateObject private var starshipViewModel = ShipsViewModel()
    @State private var selectedView = 0

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Seleccione la vista", selection: $selectedView) {
                    Text("Vehículos").tag(0)
                    Text("Naves").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if selectedView == 0 {
                    List(vehicleViewModel.vehicles ?? []) { vehicle in
                        NavigationLink(destination: VehiclesDetailView(vehicles: vehicle)) {
                            HStack {
                                Text(vehicle.name)
                            }
                        }
                    }
                } else {
                    List(starshipViewModel.ships ?? []) { ship in
                        NavigationLink(destination: StarshipDetailView(ships: ship)) {
                            HStack {
                                Text(ship.name)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Vehículos y Naves")
        }
        .onAppear {
            Task {
                do {
                    try await vehicleViewModel.fetchVehicles()
                    try await starshipViewModel.fetchShips()
                } catch(let error) {
                    print("Error: \(error)")
                }
            }
        }
    }
}

// Aquí el código del Preview
