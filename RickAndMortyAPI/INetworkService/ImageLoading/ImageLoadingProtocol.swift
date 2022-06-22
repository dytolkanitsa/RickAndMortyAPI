//
//  ImageLoadingProtocol.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation
import UIKit

protocol ImageLoadingProtocol {
    func loadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void)
}
