//
//  GalleryCollectionViewCell.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 25.05.2022.
//

import UIKit


final class GalleryCollectionViewCell: UICollectionViewCell {
    
    let mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.backgroundColor = .systemGreen
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.contentMode = .scaleAspectFit
        return mainImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor  = .systemCyan
        contentView.addSubview(mainImageView)

        mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
