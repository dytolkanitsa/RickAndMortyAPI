//
//  TableViewPresenterProtocol.swift
//  newProject
//
//  Created by Толканица Дарья on 03.06.2022.
//

import Foundation

// MARK: - View Output (Presenter -> View)
/// Протокол отвечает за отображение информации в таблице и передачу информации другому вью при нажатии на отдельную ячейку
protocol MainOutputProtocol: AnyObject {
    var response: SearchResponse? { get set }
    
    func viewDidLoad()
    /// Отвечает за отображение информации в ячейке
    /// - Parameter indexPath: индекс ячейки, в которую надо записать информацию
    func putDataInCell(_ indexPath: IndexPath)
    // это и viewdidload оставить остальное удалить
    /// Отвечает за логику нажатия на отдельную ячеку
    /// - Parameter indexPath: индекс ячейки, на которую нажали
    func tableCellTapped(_ indexPath: IndexPath)
}
