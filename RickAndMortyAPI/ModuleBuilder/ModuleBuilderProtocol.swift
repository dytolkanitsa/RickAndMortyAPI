//
//  ModuleBuilderProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation
import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    static func createMainModule() -> UIViewController
    static func createDetailModule(character: DetailInformation?) -> UIViewController
    static func createInformationModule() -> UIViewController
    static func createTabBar() -> UITabBarController
}
