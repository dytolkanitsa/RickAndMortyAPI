//
//  UICollectionView.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 25.05.2022.
//

import UIKit

struct Cats {
    var catsImage: UIImage
    
    static func fetchCats() -> [Cats] {
        let firstImage = Cats(catsImage: UIImage(named: "cat3")!)
        let secondImage = Cats(catsImage: UIImage(named: "cat2")!)
        let thirdImage = Cats(catsImage: UIImage(named: "cat1")!)
        
        return [firstImage, secondImage, thirdImage]
    }
}

final class GalleryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cellsCats = [Cats]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 20
        contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        backgroundColor = .systemCyan
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [Cats]) {
        self.cellsCats = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsCats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! GalleryCollectionViewCell
        cell.mainImageView.image = cellsCats[indexPath.row].catsImage
        return cell
    }
}
