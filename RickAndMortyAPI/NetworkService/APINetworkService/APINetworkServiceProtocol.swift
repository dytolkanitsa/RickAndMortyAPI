//
//  NetworkServiceProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation

/// Отвечает за загрузку всей информации об персонажах
protocol APINetworkServiceProtocol {
    /// Загружает всю информацию об персонажах
    /// - Parameters:
    ///   - urlString: url адрес
    ///   - completion: SearchResponse - результат парсинга со всеми данными о персонажах, Error - ошибка
    func fetchRMCharacters(urlString: String, completion: @escaping (Result<SearchResponse, Error>) -> Void)
}
