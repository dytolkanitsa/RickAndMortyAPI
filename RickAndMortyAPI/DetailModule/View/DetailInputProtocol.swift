//
//  DetailViewProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 03.06.2022.
//

import Foundation
import UIKit

// MARK: - View Input (View -> Presenter)
/// Протокол устанавливает строку в качестве заголовка, помещает информацию в массив для дальнейшей работы
protocol DetailInputProtocol: AnyObject {
    var infoArray: [String] { get set }
    var characterId: Int { get set }
    /// Устанавливает переданную строку  в качестве текста  в лэйбле
    /// - Parameter name: имя персонажа
    func displayTitle(name: String)
    /// станавливает переданный UIImage  в икноку персонажа
    /// - Parameter image: изображние выбранного персонажа
    func displayImage(image: UIImage)
    /// Помещает в поля textField комментарий к определенному персонажу
    /// - Parameter userModel: Элемент массива, содержащего имя и сам комментарий
    func displayComment(userModel: UserModel)
    /// Отображение ошишбки в случае неудачной работы сервиса
    /// - Parameter error: ошибка
    func showError(error: Error)
}
