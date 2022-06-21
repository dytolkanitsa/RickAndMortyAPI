//
//  InteractorMainPageOutputProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 17.06.2022.
//

import Foundation

// MARK: - Interacor Input (Interactor -> Presenter)
protocol MainInteractorInputProtocol: AnyObject {
    ///  переделать на Result в фетчдата
    func fetchData(completion: @escaping (Result<SearchResponse?, Error>) -> Void)
}
