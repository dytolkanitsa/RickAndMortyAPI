//
//  viewDidLoadProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 06.06.2022.
//

import Foundation

/// Отвечает за вызов метода viewDidLoad в зависимости от вью, у которых он вызван
protocol viewDidLoadProtocol: AnyObject {
    func viewDidLoad()
}

extension viewDidLoadProtocol where Self: DetailPresenter {
    func viewDidLoad() {
        view?.displayTitle(name: character?.name)
        findComment()
    }
}

extension viewDidLoadProtocol where Self: InformationPresenter {
    func viewDidLoad() {
        self.view?.showLabelText()
    }
}
