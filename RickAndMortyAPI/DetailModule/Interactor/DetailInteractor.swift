//
//  Interactor.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 16.06.2022.
//

import UIKit

final class DetailInteractor: DetailInteractorInputProtocol {
    
    var imageV: UIImage?
    var detailInformation: DetailInformation?
    
    func loadImage(url: URL, completion: @escaping (Result<UIImage?, Error>) -> Void) {
        let imageLoading = ImageLoadingService()
        imageLoading.loadImage(from: url) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let loadImage):
                    self?.imageV = loadImage
                    completion(.success(self?.imageV))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    func saveComment(_ characterId: Int, _ name: String, _ comment: String) {
        let userObject = UserModel(id: characterId, name: name, comment: comment)
        UserCommentService.saveComment(userComment: userObject)
    }

}
