//
//  StarshipDetailView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 13/11/23.
//

import SwiftUI

struct StarshipDetailView: View {
    let ships: StarshipResult
    var body: some View {
        List{
            Section(header:
                        Text("General Information")){
                Text("Name: \(ships.name)")
                Text("Model: \(ships.model)")
                Text("Class: \(ships.starshipClass)")
                Text("Cargo Capacity: \(ships.cargoCapacity)")
                
            }
        }
    }
}

