//
//  TableViewProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 03.06.2022.
//

import Foundation
import UIKit
// Вопроc: может сделать еще один протокол, который будет отвечать только за пуш, а этот будет только за удачу/неудачу парсинга

/// Протокол отвечает  за выполнение методов в случае успешного и неудачного парсинга API , отображение нового вью
protocol TableViewParsingResults: AnyObject {
    /// Метод, который в случае успешного парсинга будет перезагружать табличные данные
    func reloadTableView()
    /// Отображает ошибку в случае неудачного парсинга API
    /// - Parameter error: ошибка
    func showError(_ error: Error)
    /// Отвечает  за показ и настройку презентации переданной вью при взаимодействии пользователя с ячейкой таблицы
    /// - Parameter view: view, которую необходимо открыть
    func pushNewView(_ view: UIViewController)
}
