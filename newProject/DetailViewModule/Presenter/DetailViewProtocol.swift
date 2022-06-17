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
protocol WorkWithRawDetailData: AnyObject {
    /// Устанавливает переданную строку  в качестве текста  в лэйбле
    /// - Parameter name: имя персонажа
    func displayTitle(name: String?)
    /// Помещает информацию о персонаже в массив
    /// - Parameter character: информация об отдельном персонаже
    func setupDataIntoArray(character: DetailInformation?,_ infoArr: [String])
    /// Помещает в поля textField комментарий к определенному персонажу
    /// - Parameter userModel: Элемент массива, содержащего имя и сам комментарий
    func presentComment(userModel: UserModel)
}
