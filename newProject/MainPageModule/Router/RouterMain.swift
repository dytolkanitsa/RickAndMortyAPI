//
//  Router.swift
//  newProject
//
//  Created by Толканица Дарья on 14.06.2022.
//

import Foundation
import UIKit

// MARK: - Router Input (Router -> Presenter)
protocol TableViewRouterInputProtocol {
    func showCharacterDetail(on view: TableViewInputProtocol?, with detail: DetailInformation?)
}

final class RouterMainPage: TableViewRouterInputProtocol {
    var presenter: TableViewOutputProtocol? // presenter
    
    func showCharacterDetail(on view: TableViewInputProtocol?, with detailInformation: DetailInformation?) {
        let characterVC = ModuleBuilder.createDetailModule(character: detailInformation)
        let viewController = view as! TableViewController
        viewController.navigationController?.pushViewController(characterVC, animated: true)
    }
}
