//
//  PokemonSelected.swift
//  pokeTest
//
//  Created by Павел Курзо on 25.07.22.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
    var types: [PokemonTypes]
    var stats: [PokemonStats]
}

struct PokemonSprites: Codable {
    var front_default: String?
}

struct PokemonTypes: Codable {
    let slot: Int
    let type: Species
}

struct Species: Codable {
    let name: String
    let url: String
}

struct PokemonStats: Codable {
    let baseStat, effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}
