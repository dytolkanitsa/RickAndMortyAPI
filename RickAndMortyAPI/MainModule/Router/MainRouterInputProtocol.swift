//
//  MainRouterInputProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation
import UIKit

// MARK: - Router Input (Router -> Presenter)
/// Отвечает за открытые нового окна при нажатии на отдельную ячейку таблицы
protocol MainRouterInputProtocol {
    /// Открывает view с детальной информацией о персонаже
    /// - Parameters:
    ///   - view: view, у которой нужно вызывать метод открытия нового окна
    ///   - detail: детальная информация об отдельном персонаже
    func showCharacterDetail(on view: MainInputProtocol?, with detail: DetailInformation?)
}

