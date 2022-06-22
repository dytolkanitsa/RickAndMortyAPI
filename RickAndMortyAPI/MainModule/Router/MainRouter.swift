//
//  Router.swift
//  newProject
//
//  Created by Толканица Дарья on 14.06.2022.
//

import Foundation
import UIKit

final class MainRouter: MainRouterInputProtocol {
    
    weak var viewController: UIViewController?

    init(_ controller: UIViewController){
        viewController = controller
    }
    
    func showCharacterDetail(on view: MainInputProtocol?, with detailInformation: DetailInformation?) {
        let detailView = ModuleBuilder.createDetailModule(character: detailInformation)
        viewController?.navigationController?.pushViewController(detailView, animated: true)
    }
}
