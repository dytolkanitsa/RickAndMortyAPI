//
//  CatsPresenter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 01.06.2022.
//

import Foundation
import UIKit

final class InformationPresenter: InformationViewPresenterProtocol {
    
    weak var view: InformationViewProtocol?
    
    init(view: InformationViewProtocol) {
        self.view = view
    }
}
