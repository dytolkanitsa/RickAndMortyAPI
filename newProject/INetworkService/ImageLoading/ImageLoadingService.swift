//
//  ImageLoading.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 20.06.2022.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoadingService: ImageLoadingProtocol {
    private var task: URLSessionDataTask?

    func loadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            completion(.success(imageFromCache))
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let newImage = UIImage(data: data) else { return }
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                completion(.success(newImage))
            }
        }
        task?.resume()
    }
}
