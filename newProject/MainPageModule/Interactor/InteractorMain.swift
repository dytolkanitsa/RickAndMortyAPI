//
//  Intepritator.swift
//  newProject
//
//  Created by Толканица Дарья on 14.06.2022.
//

import Foundation
import UIKit

protocol InteractorMainPageInputProtocol: AnyObject {
    
}

protocol InteractorMainPageOutputProtocol: AnyObject {
    func fetchData(completion: @escaping (SearchResponse?, Int?, Error?) -> Void)
    func putDataInCell(_ indexPath: IndexPath, completion: @escaping (CellData?) -> Void)
    func prepareData(_ indexPath: IndexPath, completion: @escaping (DetailInformation?) -> Void)
}

final class InteractorMainPage: InteractorMainPageOutputProtocol {
    
    var presenter: TableViewOutputProtocol? // presenter
    
    var cellData: CellData? // entity
    
    var response: SearchResponse?
    var resultsCount: Int?
    var detailInformation: DetailInformation?
    
    func fetchData(completion: @escaping (SearchResponse?, Int?, Error?) -> Void) {
        let nerworkCharacterManager = NetworkService()
        let urlString = "https://rickandmortyapi.com/api/character"
        nerworkCharacterManager.fetchRMCharacters(urlString: urlString) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResponse):
                    self?.response = searchResponse
                    self?.resultsCount = self?.response?.results.count
                    completion(self?.response, self?.resultsCount, nil)
                case .failure(let error):
                    completion(nil, nil, error)
                }
            }
        }
    }
    
    func putDataInCell(_ indexPath: IndexPath, completion: @escaping (CellData?) -> Void) {
        let oneCharacterInformation = response?.results[indexPath.row]
        guard let character = oneCharacterInformation else { return }
        cellData = CellData(title: character.name, image: character.image)
        completion(cellData)
    }
    
    func prepareData(_ indexPath: IndexPath, completion: @escaping (DetailInformation?) -> Void) {
        let selectedCharacter = response?.results[indexPath.row]
        guard let character = selectedCharacter else { return }
        detailInformation = DetailInformation(id: character.id, name: character.name, status: character.status.rawValue, species: character.species.rawValue, type: character.type, gender: character.gender.rawValue, origin: character.origin.name, location: character.location.name, image: character.image)
        completion(detailInformation)
    }
    
}
