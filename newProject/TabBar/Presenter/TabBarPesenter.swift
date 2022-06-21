//
//  TabBarPesenter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 02.06.2022.
//

import Foundation
import UIKit

/// Инициализация TabBar-a, удовлетворяющего протоколу TabBarProtocol
final class TabBarPresenter: TabBarOutputProtocol {
    
    weak var controller: TabBarInputProtocol?
    
    init(controller: TabBarInputProtocol) {
        self.controller = controller
    }
}
