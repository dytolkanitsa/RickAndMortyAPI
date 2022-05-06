//
//  DetailViewController.swift
//  newProject
//
//  Created by Дарья Толканица on 29.04.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var characterNameTitle = ""

    var pictureView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    var imageView = UIImageView()
    
    var infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.font = UIFont(name: "Damasc", size: 20)
        return label
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont(name: "Damasc", size: 20)
        return label
    }()
    
    var speciesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.font = UIFont(name: "Damasc", size: 20)
        return label
    }()

    var ChTypeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont(name: "Damasc", size: 20)
        return label
    }()
    
    var genderLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.font = UIFont(name: "Damasc", size: 20)
        return label
    }()
    
    var originLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont(name: "Damasc", size: 20)
        return label
    }()
    
    var locationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.font = UIFont(name: "Damasc", size: 20)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = characterNameTitle
        
        createPictureLabel()
        createInfoLabel()
        createNameLabel()
        createStatusLabel()
        createSpeciesLabel()
        createChTypeLabel()
        createGenderLabel()
        createOriginLabel()
        createLocationLabel()
    }
    
    private func createPictureLabel() {
        self.view.setupConstraints(label: pictureView, topAnchor: view.topAnchor, botAnchor: nil, leftAnchor: view.leadingAnchor, rightAnchor: view.trailingAnchor, topConst: 180, botConst: nil, leadingConst: 100, trailingConst: -100, heightConst: 220, widthConst: nil)
    }
    
    private func createImage() {
        self.pictureView.setupConstraints(label: self.imageView, topAnchor: self.pictureView.topAnchor, botAnchor: self.pictureView.bottomAnchor, leftAnchor: self.pictureView.leadingAnchor, rightAnchor: self.pictureView.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
    }
    
    private func createInfoLabel() {
        self.view.setupConstraints(label: infoLabel, topAnchor: view.topAnchor, botAnchor: nil, leftAnchor: view.leadingAnchor, rightAnchor: view.trailingAnchor, topConst: 450, botConst: nil, leadingConst: 20, trailingConst: -20, heightConst: 420, widthConst: nil)
    }

    private func createNameLabel() {
        self.infoLabel.setupConstraints(label: nameLabel, topAnchor: infoLabel.topAnchor, botAnchor: nil, leftAnchor: infoLabel.leadingAnchor, rightAnchor: infoLabel.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 60, widthConst: nil)
    }

    private func createStatusLabel() {
        self.infoLabel.setupConstraints(label: statusLabel, topAnchor: nameLabel.bottomAnchor, botAnchor: nil, leftAnchor: nameLabel.leadingAnchor, rightAnchor: nameLabel.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 60, widthConst: nil)
    }

    private func createSpeciesLabel() {
        self.infoLabel.setupConstraints(label: speciesLabel, topAnchor: statusLabel.bottomAnchor, botAnchor: nil, leftAnchor: statusLabel.leadingAnchor, rightAnchor: statusLabel.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 60, widthConst: nil)
    }

    private func createChTypeLabel() {
        self.infoLabel.setupConstraints(label: ChTypeLabel, topAnchor: speciesLabel.bottomAnchor, botAnchor: nil, leftAnchor: speciesLabel.leadingAnchor, rightAnchor: speciesLabel.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 60, widthConst: nil)
    }

    private func createGenderLabel() {
        self.infoLabel.setupConstraints(label: self.genderLabel, topAnchor: ChTypeLabel.bottomAnchor, botAnchor: nil, leftAnchor: ChTypeLabel.leadingAnchor, rightAnchor: ChTypeLabel.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 60, widthConst: nil)
    }

    private func createOriginLabel() {
        self.infoLabel.setupConstraints(label: self.originLabel, topAnchor: genderLabel.bottomAnchor, botAnchor: nil, leftAnchor: genderLabel.leadingAnchor, rightAnchor: genderLabel.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 60, widthConst: nil)
    }

    private func createLocationLabel() {
        self.infoLabel.setupConstraints(label: self.locationLabel, topAnchor: originLabel.bottomAnchor, botAnchor: nil, leftAnchor: originLabel.leadingAnchor, rightAnchor: originLabel.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 60, widthConst: nil)
    }
    
    func characterInformation(character: CharacterData) {
        DispatchQueue.main.async {
            self.nameLabel.text = "\tName: \(character.name)"
            self.statusLabel.text = "\tStatus: \(character.status)"
            self.speciesLabel.text = "\tSpecies: \(character.species)"
            if character.type.isEmpty {
                self.ChTypeLabel.text = "\tType: -"
            } else {
                self.ChTypeLabel.text = "\tType: \(character.type)"
            }
            self.genderLabel.text = "\tGender: \(character.gender)"
            self.originLabel.text = "\tOrigin: \(character.origin.name)"
            self.locationLabel.text = "\tLocation: \(character.location.name)"
            do {
                if let url = URL(string: character.image) {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    self.imageView = UIImageView(image: image)
                    self.createImage()
                } else {
                    self.pictureView.backgroundColor = .systemGray
                }
            } catch {
                print(error)
            }
        }
    }
}
