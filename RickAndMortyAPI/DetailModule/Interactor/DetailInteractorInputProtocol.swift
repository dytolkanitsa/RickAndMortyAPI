//
//  DetailInteractorOutputProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation
import UIKit

// MARK: - Interacor Input (Interactor -> Presenter)
/// Отвечает за загрузку изображения и сохранение комментария, оставленного пользователем
protocol DetailInteractorInputProtocol: AnyObject {
    /// Загрузка изображения по переданному url адресу
    /// - Parameters:
    ///   - url: url адрес
    ///   - completion: полученная картинка, ошибка в случае неудачной работы серввиса
    func loadImage(url: URL, completion: @escaping (Result<UIImage?, Error>) -> Void)
    /// Сохранение комментария, оставленного пользователем к определенному персонажу
    /// - Parameters:
    ///   - characterId: id персонажа
    ///   - name: имя пользователя
    ///   - comment: комментарий
    func saveComment(_ characterId: Int, _ name: String, _ comment: String)
}
