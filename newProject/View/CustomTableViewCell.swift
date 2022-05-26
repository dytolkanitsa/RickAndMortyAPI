//
//  CustomTableViewCell.swift
//  newProject
//
//  Created by Толканица Дарья on 15.05.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    private var cellStack: UIStackView = {
        let cellStack = UIStackView()
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        cellStack.axis = .horizontal
        cellStack.distribution = .fill
        cellStack.alignment = .fill
        cellStack.spacing = 10
        cellStack.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        cellStack.isLayoutMarginsRelativeArrangement = true
        cellStack.backgroundColor = appColors.black
        return cellStack
    }()
    
    private let characterImageView: CustomImageView = {
        let characterImageView = CustomImageView()
        characterImageView.layer.cornerRadius = 25
        characterImageView.layer.borderWidth = 3
        characterImageView.layer.borderColor = appColors.fountainBlue.cgColor
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
    
    func set(character: CharacterData){
        if let url = URL(string: character.image) {
            characterImageView.loadImage(from: url)
        }
        characterNameLabel.font = appFonts.characterNamesTable
        characterNameLabel.textColor = appColors.fountainBlue
        characterNameLabel.text = NSLocalizedString(character.name, comment: "")
    }
}
