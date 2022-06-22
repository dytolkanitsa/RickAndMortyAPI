//
//  TabBarPesenter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 02.06.2022.
//

import UIKit

final class TabBarPresenter: TabBarOutputProtocol {
    
    weak var controller: TabBarInputProtocol?
    
    init(controller: TabBarInputProtocol) {
        self.controller = controller
    }
}
