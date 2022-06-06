//
//  CustomImageView.swift
//  newProject
//
//  Created by Дарья Толканица on 16.05.2022.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

final class CustomImageView: UIImageView {
    
    private var task: URLSessionDataTask?
    
    func loadImage(from url: URL) {
        
        image = nil
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let newImage = UIImage(data: data) else { return }
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task?.resume()
    }
}
