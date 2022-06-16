//
//  MainPresenter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 01.06.2022.
//

import Foundation
import UIKit

final class TableViewPresenter: TableViewOutputProtocol {
    
    weak var view: TableViewInputProtocol? // view
    var interactor: InteractorMainPageOutputProtocol? // interactor
    var router: RouterMainPageInputProtocol? // router
    
    var response: SearchResponse?
    var resultsCount: Int?
    
    var cellData: CellData?
    var detailInformation: DetailInformation?
    
    init(view: TableViewInputProtocol, interactor: InteractorMainPageOutputProtocol) {
        self.view = view
        self.interactor = interactor
        
        getData()
    }
    
    func getData() {
        interactor?.fetchData { [weak self] networkResponsse, numberOfResults, networkError in
            guard let networkResponsse1 = networkResponsse, let numberOfResults1 = numberOfResults else {
                self?.view?.showError(networkError)
                return
            }
            self?.response = networkResponsse1
            self?.resultsCount = numberOfResults1
            self?.view?.reloadTableView()
        }
    }
    
    func putDataInCell(_ indexPath: IndexPath) {
        interactor?.putDataInCell(indexPath) { [weak self] cellData in
            guard let cellData = cellData else {
                return
            }
            self?.cellData = cellData
        }
    }
    
    func tableCellTapped(_ indexPath: IndexPath) {
        interactor?.prepareData(indexPath, completion: { [weak self] detailInformation in
            let characterVC = ModuleBuilder.createDetailModule(character: detailInformation)
            self?.view?.pushNewView(characterVC)
        })
    }
}
