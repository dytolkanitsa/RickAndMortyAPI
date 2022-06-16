//
//  ModuleBuilder.swift
//  newProject
//
//  Created by Толканица Дарья on 01.06.2022.
//

import Foundation
import UIKit


protocol Builder: AnyObject {
    static func createTableViewModule() -> UIViewController
    static func createDetailModule(character: DetailInformation?) -> UIViewController
    static func createInformationView() -> UIViewController
    static func createTabController() -> UITabBarController
}

final class ModuleBuilder: Builder {
    
    static func createTableViewModule() -> UIViewController {
        let view = TableViewController()
        let interactor = InteractorMainPage()
        let presenter = TableViewPresenter(view: view, interactor: interactor)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(character: DetailInformation?) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, character: character)
        view.presenter = presenter
        return view
    }
    
    static func createInformationView() -> UIViewController {
        let view = InformationViewController()
        let presenter = InformationPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createTabController() -> UITabBarController {
        let tabBar = TabBarController()
        let presenter = TabBarPresenter(controller: tabBar)
        tabBar.presenter = presenter
        return tabBar
    }
}
