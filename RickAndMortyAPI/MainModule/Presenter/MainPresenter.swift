//
//  MainPresenter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 01.06.2022.
//

import Foundation
import UIKit

final class MainPresenter: MainOutputProtocol {
    
    weak var view: MainInputProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterInputProtocol?
    var response: SearchResponse?
    
    init(view: MainInputProtocol, interactor: MainInteractorInputProtocol, router: MainRouterInputProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        self.interactor?.fetchData { [weak self] (result) in
            switch result {
            case .success(let searchResponse):
                self?.processSuccessResponse(searchResponse)
            case .failure(let error):
                self?.view?.showError(error)
            }
        }
    }
    
    func processSuccessResponse(_ searchResponse: SearchResponse?) {
        response = searchResponse
        let cellData = response?.results.compactMap({ data in
            CellData(title: data.name, image: data.image)
        })
        view?.display(cellData: cellData ?? [])
        view?.reloadTable()
    }
    
    func tableCellTapped(_ indexPath: IndexPath) {
        let selectedCharacter = response?.results[indexPath.row]
        guard let character = selectedCharacter else {
            return
        }
        let detailInformation = DetailInformation(id: character.id, name: character.name, status: character.status.rawValue, species: character.species.rawValue, type: character.type, gender: character.gender.rawValue, origin: character.origin.name, location: character.location.name, image: character.image)
        self.router?.showCharacterDetail(on: self.view, with: detailInformation)
    }
    
}
