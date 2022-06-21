//
//  DetailViewPresenterProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 03.06.2022.
//

import Foundation

// MARK: - View Output (Presenter -> View)
/// Отвечает за логику отработки нажатия на кнопку сохранения
protocol DetailOutputProtocol: AnyObject {
    func viewDidLoad()
    
    /// Получает оставленный пользователем комментарий при нажатии на кнопку сохранения
    /// - Parameters:
    ///   - name: имя пользователя
    ///   - comment: комментарий
    func saveButtonTapped(_ name: String, _ comment: String)
}
