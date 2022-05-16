//
//  CustomTableViewCell.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 15.05.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    let identifier = "cell"
    private let characterImageView = UIImageView()
    private let characterNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(characterImageView)
        addSubview(characterNameLabel)
        
        configureImageView()
        configureNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func set(character: CharacterData, image: UIImage){
        characterImageView.image = image
        characterNameLabel.text = character.name
    }
    
    private func setImageView() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        characterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        characterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        characterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -340).isActive = true
    }
    
    private func setNameLabel() {
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20).isActive = true
        characterNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
