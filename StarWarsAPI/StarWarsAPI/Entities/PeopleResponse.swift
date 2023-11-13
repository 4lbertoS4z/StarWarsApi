//
//  PeopleResponse.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import Foundation

// MARK: - PeopleResponse
struct PeopleResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PeopleResult]
}

// MARK: - Result
struct PeopleResult: Codable, Identifiable {
    // Esta es la propiedad que cumplirá con el protocolo Identifiable
    var id: String { url }
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let gender: Gender
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
    case nA = "n/a"
}

