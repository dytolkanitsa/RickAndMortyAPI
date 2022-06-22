//
//  InformationViewProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 03.06.2022.
//

import Foundation

// MARK: - View Input (View -> Presenter)
/// Отвечает за отображение информации о разработчике и индекс ячейки в collection view, отображенной на экране
protocol InformationInputProtocol: AnyObject {
    
    /// Устанавливает имя разработчика в лэйбл
    func showLabelText()
    /// Получает индекс и общее количество ячеек в collection view
    /// - Parameters:
    ///   - index: индекс ячейки
    ///   - numberOfCells: общее количество ячеек
    func showNumberOfCell(index: Int, numberOfCells: Int)
}

