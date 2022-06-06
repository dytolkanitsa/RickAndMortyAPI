//
//  TabBarController.swift
//  newProject
//
//  Created by Толканица Дарья on 25.05.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    var presenter: TabBarPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewVC = ModuleBuilder.createTableViewModule()
        let informationVC = ModuleBuilder.createInformationView()
        
        tableViewVC.title = appLocalization.localization(key: "[Characters]")
        informationVC.title = appLocalization.localization(key: "[Information]")
        
        let navigationContrTV = LightContentNavigationController(rootViewController: tableViewVC)
        let navigationContrInf = LightContentNavigationController(rootViewController: informationVC)
        
        self.setViewControllers([navigationContrTV, navigationContrInf], animated: false)
        guard let items = self.tabBar.items else {return}

        let images = ["rick", "morty"]

        for x in 0..<items.count {
            items[x].image = UIImage(named: images[x])?.withRenderingMode(.alwaysOriginal)
        }
    }
}

extension TabBarController: TabBarProtocol { }

class LightContentNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
