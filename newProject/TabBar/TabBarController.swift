//
//  TabBarController.swift
//  newProject
//
//  Created by Толканица Дарья on 25.05.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewVC = TableViewController()
        let secondVC = CatsView()
        
        tableViewVC.title = appLocalization.localization(key: "[Characters]")
        secondVC.title = appLocalization.localization(key: "[Cats]")
        
        let navigationContrTV = LightContentNavigationController(rootViewController: tableViewVC)
        let navigationContrRC = LightContentNavigationController(rootViewController: secondVC)
        
        self.setViewControllers([navigationContrTV, navigationContrRC], animated: false)
        
        guard let items = self.tabBar.items else {return}
        let images = ["rick", "morty"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(named: images[x])?.withRenderingMode(.alwaysOriginal)
        }
    }
}

class LightContentNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
