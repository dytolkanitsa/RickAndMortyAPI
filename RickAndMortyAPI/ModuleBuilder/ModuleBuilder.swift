//
//  ModuleBuilder.swift
//  newProject
//
//  Created by Толканица Дарья on 01.06.2022.
//

import UIKit

final class ModuleBuilder: ModuleBuilderProtocol {
    
    static func createMainModule() -> UIViewController {
        let mainView = MainController()
        let interactor = MainInteractor()
        let router = MainRouter(mainView)
        let output = MainPresenter(view: mainView, interactor: interactor, router: router)
        mainView.output = output
        return mainView
    }
    
    static func createDetailModule(character: DetailInformation?) -> UIViewController {
        let detailView = DetailController()
        let interactor = DetailInteractor()
        let output = DetailPresenter(view: detailView, interactor: interactor, character: character)
        detailView.output = output
        return detailView
    }
    
    static func createInformationModule() -> UIViewController {
        let informationView = InformationController()
        let output = InformationPresenter(view: informationView)
        informationView.output = output
        return informationView
    }
    
    static func createTabBar() -> UITabBarController {
        let tabBar = TabBarController()
        let output = TabBarPresenter(controller: tabBar)
        tabBar.output = output
        return tabBar
    }
}
