//
//  InformationViewProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 03.06.2022.
//

import Foundation
import UIKit

// MARK: - View Input (View -> Presenter)
/// Отвечает за отображение информации о разработчике
protocol InformationViewProtocol: AnyObject {
    ///  Устанавливает имя разработчика в лэйбл
    func showLabelText()
    func showNumberOfCell(index: Int, numberOfCells: Int)
}

