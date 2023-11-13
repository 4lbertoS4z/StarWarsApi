//
//  PlanetDetailView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import SwiftUI

struct PlanetDetailView: View {
    @StateObject private var viewModel = PlanetViewModel()
    let planetUrl: String
    
    var body: some View {
        VStack {
            if let planet = viewModel.planet {
                // La información del planeta se mostrará aquí
                Text(planet.name)
                    .font(.title)
                // Agrega más detalles del planeta aquí como desees
            } else {
                Text("Loading planet details...")
                    .font(.headline)
            }
        }
        .onAppear {
            // Llamada para cargar los detalles del planeta cuando la vista aparece
            Task {
                await viewModel.fetchPlanetDetails(from: planetUrl)
            }
        }
        .navigationTitle("Planet Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Necesitarás proveer una URL válida de un planeta para el preview
// Por ejemplo:
// PlanetDetailView(planetUrl: "https://swapi.dev/api/planets/1/")


