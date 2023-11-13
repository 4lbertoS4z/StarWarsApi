//
//  FilmResponse.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import Foundation

// MARK: - FilmResponse
struct FilmResponse: Codable {
    let count: Int
    let next: String?
        let previous: String?
    let results: [FilmResult]
}

// MARK: - Result
struct FilmResult: Codable, Identifiable {
    // Esta es la propiedad que cumplirá con el protocolo Identifiable
    var id: String { url }

    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}
