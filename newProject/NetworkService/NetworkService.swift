//
//  NetworkManager.swift
//  newProject
//
//  Created by Дарья Толканица on 27.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchRMCharacters(urlString: String, completion: @escaping (Result<SearchResponse, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func fetchRMCharacters(urlString: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let characters = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(.success(characters))
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(.failure(jsonError))
            }
        }
           task.resume()
    }
}

