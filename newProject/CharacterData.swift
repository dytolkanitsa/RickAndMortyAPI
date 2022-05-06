//
//  CharacterDate.swift
//  newProject
//
//  Created by Дарья Толканица on 28.04.2022.
//

import Foundation

struct SearchResponse: Codable {
    let info: Info
    let results: [CharacterData]
}

struct Info: Codable {
    let count, pages: Int
    let next: String
}

struct CharacterData: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Codable {
    let name: String
    let url: String
}
