//
//  PokemonSelected.swift
//  pokeTest
//
//  Created by Павел Курзо on 24.07.22.
//

import Foundation


class PokemonSelectedAPI {
    
    func getData(url: String, completion: @escaping (Result <PokemonSelected, Error>) -> Void) {
        guard let url = URL(string: url) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.noAnyData))
                return
            }
            do {
                let pokemonSprite = try JSONDecoder().decode(PokemonSelected.self, from: data)
                completion(.success(pokemonSprite))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
