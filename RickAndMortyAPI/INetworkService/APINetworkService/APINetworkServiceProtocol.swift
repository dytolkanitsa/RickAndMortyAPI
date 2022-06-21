//
//  NetworkServiceProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation

protocol APINetworkServiceProtocol {
    func fetchRMCharacters(urlString: String, completion: @escaping (Result<SearchResponse, Error>) -> Void)
}
