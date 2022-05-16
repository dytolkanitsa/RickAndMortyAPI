//
//  AppDelegate.swift
//  newProject
//
//  Created by Дарья Толканица on 27.04.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        let mainViewController = ViewController()
        let navigationController = UINavigationController.init(rootViewController: mainViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigationController
        
        
        return true
    }
}
