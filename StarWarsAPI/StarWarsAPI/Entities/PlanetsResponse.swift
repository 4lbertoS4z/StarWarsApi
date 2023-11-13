//
//  PlanetsResponse.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import Foundation

// MARK: - PlanetsResponse
struct PlanetsResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PlanetResult]
}

// MARK: - Result
struct PlanetResult: Codable, Identifiable {
    var id: String { url }
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}



