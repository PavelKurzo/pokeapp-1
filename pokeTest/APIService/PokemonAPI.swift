//
//  Pokemon.swift
//  pokeTest
//
//  Created by Павел Курзо on 24.07.22.
//

import Foundation
import UIKit

class PokeAPI {
    
    func getData(completion: @escaping (Result<[PokemonEntry], Error>) -> Void) {
        let stringUrl = "https://pokeapi.co/api/v2/pokemon?limit=20"
        guard let url = URL(string: stringUrl) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.noAnyData))
                return
            }
            do {
                let result = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        })
        task.resume()
    }
}
