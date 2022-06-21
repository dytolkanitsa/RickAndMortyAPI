//
//  DetailViewPresenterProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 03.06.2022.
//

import Foundation

// MARK: - View Output (Presenter -> View)
protocol DetailOutputProtocol: AnyObject {
    func viewDidLoad()
    
    // действие пользоввтель оставил коммент, чтобы вью сказала презентеру , а тот интерактору
    func saveButtonTapped(_ name: String, _ comment: String)
}
