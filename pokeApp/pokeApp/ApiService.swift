//
//  ApiService.swift
//  pokeApp
//
//  Created by Павел Курзо on 18.07.22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class APIService {
    static let shared = APIService()
    
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    
    func getPokemon() {
        let requestURL = baseURL
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching pokemon: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Welcome.self, from: data)
            } catch {
                print("Error decoding Pokemon: \(error)")
                return
            }
        }.resume()
    }
}
