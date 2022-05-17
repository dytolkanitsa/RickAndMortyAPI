//
//  CustomTableViewCell.swift
//  newProject
//
//  Created by Толканица Дарья on 15.05.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    private var safeArea: UILayoutGuide!
    private let characterImageView = CustomImageView()
    private let characterNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        safeArea = layoutMarginsGuide
        configureImageView()
        configureNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(character: CharacterData){
        if let url = URL(string: character.image) {
            characterImageView.loadImage(from: url)
        }
        characterNameLabel.text = character.name
    }
    
    // MARK: - Configuration
    private func configureImageView() {
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
        
        setImageView()
    }
    
    private func configureNameLabel() {
        characterNameLabel.numberOfLines = 0
        characterNameLabel.adjustsFontSizeToFitWidth = true
        
        setNameLabel()
    }
    
    // MARK: - Setup
    private func setImageView() {
        addSubview(characterImageView)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        characterImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setNameLabel() {
        addSubview(characterNameLabel)
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20).isActive = true
        characterNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
