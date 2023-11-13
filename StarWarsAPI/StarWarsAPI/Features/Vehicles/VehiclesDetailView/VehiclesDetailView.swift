//
//  VehiclesDetailView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 13/11/23.
//

import SwiftUI

struct VehiclesDetailView: View {
    let vehicles: VehicleResult
    var body: some View {
        List{
            Section(header:
                        Text("General Information")){
                Text("Name: \(vehicles.name)")
                Text("Model: \(vehicles.model)")
                Text("Class: \(vehicles.vehicleClass)")
                Text("Cargo Capacity: \(vehicles.cargoCapacity)")
                
            }
        }
    }
}

