//
//  TableViewProtocol.swift
//  newProject
//
//  Created by Толканица Дарья on 03.06.2022.
//

import Foundation

// MARK: - View Input (View -> Presenter)
/// Протокол отвечает за  успешное и неудачное выполнение парсинга API , отображение нового вью
protocol MainInputProtocol: AnyObject {
    var characterData: CellData? { get set }
    var response: SearchResponse? { get set }
    /// Перезагрузка табличных данных
    func reloadTable()
    /// Отображает ошибку в случае неудачного парсинга API
    /// - Parameter error: ошибка
    func showError(_ error: Error)
}
