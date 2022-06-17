//
//  DetailViewPresenterProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 03.06.2022.
//

import Foundation
import UIKit

// MARK: - View Output (Presenter-> View)
protocol DetailViewPresenterProtocol: AnyObject {
    func viewDidLoad()
    func putDataIntoArray()
}
