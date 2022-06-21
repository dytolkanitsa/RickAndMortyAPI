//
//  CustomTableViewCell.swift
//  newProject
//
//  Created by Толканица Дарья on 15.05.2022.
//

import UIKit

final class MainCustomTableViewCell: UITableViewCell {

    private let cellStack: UIStackView = {
        let cellStack = UIStackView()
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        cellStack.axis = .horizontal
        cellStack.distribution = .fill
        cellStack.alignment = .fill
        cellStack.spacing = 10
        cellStack.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 0)
        cellStack.isLayoutMarginsRelativeArrangement = true
        cellStack.backgroundColor = appColors.black
        return cellStack
    }()
    
    private let characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.layer.cornerRadius = 25
        characterImageView.layer.borderWidth = 3
        characterImageView.layer.borderColor = appColors.systemMint.cgColor
        characterImageView.clipsToBounds = true
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        characterImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return characterImageView
    }()
    
    private let characterNameLabel: UILabel = {
        let characterNameLabel = UILabel()
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return characterNameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupCellStackConstraints()
    }
    
    private func setupCellStackConstraints() {
        addSubview(cellStack)
        NSLayoutConstraint.activate([
            cellStack.topAnchor.constraint(equalTo: topAnchor),
            cellStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellStack.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        cellStack.addArrangedSubview(characterImageView)
        cellStack.addArrangedSubview(characterNameLabel)
    }
    
    func set(character: CellData){

        let imageLoading = ImageLoadingService()
        guard let url = URL(string: character.image) else {
            return
        }
        imageLoading.loadImage(from: url) { result in
            switch result {
            case .success(let loadImage):
                self.characterImageView.image = loadImage
            case .failure(let error):
                print("\(error)")
            }
        }
        characterNameLabel.font = appFonts.characterNamesTable
        characterNameLabel.textColor = appColors.fountainBlue
        characterNameLabel.text = appLocalization.localization(key: character.title)
    }
}
