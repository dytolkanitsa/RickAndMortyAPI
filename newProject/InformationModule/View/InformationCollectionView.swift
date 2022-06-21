//
//  UICollectionView.swift
//  newProject
//
//  Created by Толканица Дарья on 25.05.2022.
//

import UIKit

final class InformationCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var presenter: InformationOutputProtocol?
    var cellsCats = [CatsImages]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        register(InformationCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 0
        backgroundColor = appColors.systemCyan
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [CatsImages], presenter: InformationOutputProtocol) {
        self.cellsCats = cells
        self.presenter = presenter
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsCats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? InformationCollectionViewCell else {
            return self.dequeueReusableCell(withReuseIdentifier: "clearCell", for: indexPath)
        }
        cell.mainImageView.image = cellsCats[indexPath.row].catsImage
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in self.visibleCells {
            guard let indexPath = self.indexPath(for: cell) else { return }
            presenter?.showImageIndex(indexPath, cellsCats.count)
        }
    }
}
