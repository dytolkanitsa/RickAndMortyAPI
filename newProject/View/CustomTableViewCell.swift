//
//  CustomTableViewCell.swift
//  newProject
//
//  Created by Толканица Дарья on 15.05.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    private var cellStack = UIStackView()
    private let characterImageView = CustomImageView()
    private let characterNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStack()
        configureImageView()
        configureNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStack() {
        addSubview(cellStack)
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellStack.topAnchor.constraint(equalTo: topAnchor),
            cellStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellStack.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        cellStack.axis = .horizontal
        cellStack.distribution = .fill
        cellStack.alignment = .fill
        cellStack.spacing = 10
        cellStack.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        cellStack.isLayoutMarginsRelativeArrangement = true
        cellStack.backgroundColor = .black
        cellStack.addArrangedSubview(characterImageView)
        cellStack.addArrangedSubview(characterNameLabel)
    }
    
    func set(character: CharacterData){
        if let url = URL(string: character.image) {
            characterImageView.loadImage(from: url)
        }
        characterNameLabel.font = UIFont(name: "GetSchwifty-Regular", size: 20)
        characterNameLabel.textColor = UIColor(red: 90/255, green: 193/255, blue: 184/255, alpha: 1)
        characterNameLabel.text = NSLocalizedString(character.name, comment: "")
    }
    
    // MARK: - Configuration
    private func configureImageView() {
        characterImageView.layer.cornerRadius = 25
        characterImageView.layer.borderWidth = 3
        characterImageView.layer.borderColor = (UIColor(red: 90/255, green: 193/255, blue: 184/255, alpha: 1)).cgColor
        characterImageView.clipsToBounds = true
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        characterImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func configureNameLabel() {
//        characterNameLabel.numberOfLines = 0
//        characterNameLabel.adjustsFontSizeToFitWidth = true
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
