//
//  DetailViewController.swift
//  newProject
//
//  Created by Дарья Толканица on 29.04.2022.
//

import UIKit

final class DetailViewController: UIViewController {
   
    private var myScrollView = UIScrollView()
    private var myStackView = UIStackView()
    private let nameLabel = UILabel()
    private var infoArray = [String]()
    private let imageView = CustomImageView()
    var character: CharacterData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScroll()
        setupLabel()
        setupStack()
        setupData()
        makeLabelArray()
    }
    
    private func setupData() {
        infoArray.append("Name: \(character?.name ?? "-")")
        infoArray.append("Status: \(character?.status.rawValue ?? "-")")
        infoArray.append("Species: \(character?.species.rawValue ?? "-")")
        infoArray.append("Type: \(character?.type ?? "-")")
        infoArray.append("Gender: \(character?.gender.rawValue ?? "-")")
        infoArray.append("Origin place: \(character?.origin.name ?? "-")")
        infoArray.append("Current location: \(character?.location.name ?? "-")")
        
        if let character = character,
           let url = URL(string: character.image)
        {
            imageView.loadImage(from: url)
            createImage()
        }
    }
    
    private func createImage() {
        myScrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 90).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        imageView.bottomAnchor.constraint(equalTo: myStackView.topAnchor, constant: -50).isActive = true
        imageView.backgroundColor = .gray
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
    }
    
    private func setupScroll() {
        myScrollView = UIScrollView(frame: self.view.bounds)
        view.addSubview(myScrollView)
        myScrollView.backgroundColor = .systemMint
    }
    
    private func setupLabel() {
        myScrollView.addSubview(nameLabel)
        nameLabel.text = "\(character?.name ?? "-")"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        nameLabel.textAlignment = .natural
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        
        setLabelConstrains()
    }
    
    private func setupStack(){
        myScrollView.addSubview(myStackView)
        myStackView.axis = .vertical
        myStackView.distribution = .fillEqually
        myStackView.alignment = .fill
        myStackView.spacing = 10
        myStackView.backgroundColor = .systemYellow
        
        setStackViewConstrains()
    }
    
    private func setLabelConstrains() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -750).isActive = true
    }
    
    private func setStackViewConstrains() {
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 340).isActive = true
        myStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        myStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        myStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
    }
    
    private func createLabel(withColor color: UIColor, title: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = color
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.text = " \(title)"
        label.textColor = .white
        return label
    }
    
    private func makeLabelArray() {
        var labelArray = [UILabel]()
        for labelValue in infoArray {
            labelArray += [createLabel(withColor: .systemCyan, title: labelValue)]
        }
        
        myStackView = UIStackView(arrangedSubviews: labelArray)
        setupStack()
    }
}
