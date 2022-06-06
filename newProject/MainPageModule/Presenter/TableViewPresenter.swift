//
//  MainPresenter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 01.06.2022.
//

import Foundation
import UIKit

final class TableViewPresenter: TableViewDataCoordination {

    weak var view: TableViewParsingResults?
    let networkService: NetworkServiceProtocol?
    var response: SearchResponse?
    
    var resultsCount: Int?
    var cellData: CellData?
    var detailInformation: DetailInformation?
    
    init(view:TableViewParsingResults, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        fetchData()
    }
    
    func putDataInCell(_ indexPath: IndexPath) {
        let oneCharacterInformation = response?.results[indexPath.row]
        guard let character = oneCharacterInformation else { return }
        cellData = CellData(title: character.name, image: character.image)
    }
    
    func tableCellTapped(_ indexPath: IndexPath) {
        let selectedCharacter = response?.results[indexPath.row]
        guard let character = selectedCharacter else { return }
        detailInformation = DetailInformation(id: character.id, name: character.name, status: character.status.rawValue, species: character.species.rawValue, type: character.type, gender: character.gender.rawValue, origin: character.origin.name, location: character.location.name, image: character.image)
        let characterVC = ModuleBuilder.createDetailModule(character: detailInformation)
        view?.pushNewView(characterVC)
    }
    
    func fetchData() {
        let nerworkCharacterManager = NetworkService()
        let urlString = "https://rickandmortyapi.com/api/character"
        nerworkCharacterManager.fetchRMCharacters(urlString: urlString) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResponse):
                    self?.response = searchResponse
                    self?.resultsCount = self?.response?.results.count
                    self?.view?.reloadTableView()
                case .failure(let error):
                    self?.view?.showError(error)
                }
            }
        }
    }
}
