//
//  TabBarController.swift
//  newProject
//
//  Created by Толканица Дарья on 25.05.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    var output: TabBarOutputProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewVC = ModuleBuilder.createMainModule()
        let informationVC = ModuleBuilder.createInformationModule()
        
        tableViewVC.title = appLocalization.localization(key: "[Characters]")
        informationVC.title = appLocalization.localization(key: "[Information]")
        
        let navigationContrTV = LightContentNavigationController(rootViewController: tableViewVC)
        let navigationContrInf = LightContentNavigationController(rootViewController: informationVC)
        
        self.setViewControllers([navigationContrTV, navigationContrInf], animated: false)
        guard let items = self.tabBar.items else {
            return
        }
        let images = ["rick", "morty"]
        
        zip(items, images).forEach { item, imageName in
            item.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        }
    }
}

extension TabBarController: TabBarInputProtocol { }

class LightContentNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
