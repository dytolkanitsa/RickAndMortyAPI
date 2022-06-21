//
//  DetailInteractorOutputProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation
import UIKit

// MARK: - Interacor Input (Interactor -> Presenter)
protocol DetailInteractorInputProtocol: AnyObject {
    func loadImage(url: URL, completion: @escaping (Result<UIImage?, Error>) -> Void)
    func saveComment(_ characterId: Int, _ name: String, _ comment: String)
}
