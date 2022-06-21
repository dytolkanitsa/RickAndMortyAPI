//
//  MainRouterInputProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation
import UIKit

// MARK: - Router Input (Router -> Presenter)
protocol MainRouterInputProtocol {
    func showCharacterDetail(on view: MainInputProtocol?, with detail: DetailInformation?)
}
