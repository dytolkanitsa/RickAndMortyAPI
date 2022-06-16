//
//  InformationViewPresenterProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 03.06.2022.
//

import Foundation
import UIKit

// MARK: - View Output (Presenter-> View)
protocol InformationViewPresenterProtocol: AnyObject {
    func viewDidLoad()
    ///  Метод отвечает за передачу во вью индекса ячейки, на которой пользователь находится в данный момент, и вывод ее на экран
    /// - Parameters:
    ///   - indexPath: индекс ячейки, которая в данный момент отображается на экаране
    ///   - numberOfCell: общее количесто  ячеек
    func showImageIndex(_ indexPath: IndexPath,_ numberOfCell: Int)
}
