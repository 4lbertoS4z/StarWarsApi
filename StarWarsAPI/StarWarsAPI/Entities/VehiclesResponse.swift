//
//  VehiclesResponse.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import Foundation

// MARK: - VehiclesResponse
struct VehiclesResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [VehicleResult]
}

// MARK: - Result
struct VehicleResult: Codable, Identifiable {
    // Esta es la propiedad que cumplirá con el protocolo Identifiable
    var id: String { url }
    let name, model, manufacturer, costInCredits: String
    let length, maxAtmospheringSpeed, crew, passengers: String
    let cargoCapacity, consumables, vehicleClass: String
    let pilots, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew, passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case vehicleClass = "vehicle_class"
        case pilots, films, created, edited, url
    }
}

