//
//  TabBarController.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 25.05.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewVC = TableViewController()
        let secondVC = SecondView()
        
        tableViewVC.title = NSLocalizedString("[Characters]", comment: "")
        secondVC.title = NSLocalizedString("[Cats]", comment: "")
        
        let navigationContrTV = UINavigationController(rootViewController: tableViewVC)
        let navigationContrRC = UINavigationController(rootViewController: secondVC)
        
        self.setViewControllers([navigationContrTV, navigationContrRC], animated: false)
        
        guard let items = self.tabBar.items else {return}
        let images = ["rick", "morty"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(named: images[x])?.withRenderingMode(.alwaysOriginal)
        }
        UITabBar.appearance().barTintColor = UIColor.black
    }

}
