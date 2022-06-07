//
//  GalleryCollectionViewCell.swift
//  newProject
//
//  Created by Толканица Дарья on 25.05.2022.
//

import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
   
    let galleryScroll: UIScrollView = {
        let galleryScroll = UIScrollView()
        galleryScroll.translatesAutoresizingMaskIntoConstraints = false
        return galleryScroll
    }()
    
    let mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.backgroundColor = appColors.systemGreen
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        return mainImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor  = appColors.systemCyan
        contentView.addSubview(galleryScroll)
        galleryScroll.addSubview(mainImageView)
        
        galleryScroll.delegate = self
        galleryScroll.maximumZoomScale = 3.5
        galleryScroll.minimumZoomScale = 1
        
        galleryScroll.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        galleryScroll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        galleryScroll.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        galleryScroll.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryCollectionViewCell: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mainImageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        galleryScroll.zoomScale = 1
    }
}
