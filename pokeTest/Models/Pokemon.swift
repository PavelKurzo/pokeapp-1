//
//  Pokemon.swift
//  pokeTest
//
//  Created by Павел Курзо on 25.07.22.
//

import Foundation

struct Pokemon: Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable {
//    var id = UUID()
    var name: String
    var url: String
}

enum APIError: Error {
case noAnyData
}
