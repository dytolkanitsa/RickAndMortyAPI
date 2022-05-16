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
    private var characterNameTitle = ""
    private let nameLabel = UILabel()
    private var infoArray = [String]()
    private var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScroll()
        setupLabel()
        makeLabelArray()
    }
    
    func characterInformation(character: CharacterData) {
        let charStruct = Character(characterData: character)
        characterNameTitle = charStruct!.nameOfCh
        infoArray.append("Name: \(charStruct?.nameOfCh ?? "-")")
        infoArray.append("Status: \(charStruct?.statusOfCh ?? "-")")
        infoArray.append("Species: \(charStruct?.speciesOfCh ?? "-")")
        infoArray.append("Type: \(charStruct?.typeOfCh ?? "-")")
        infoArray.append("Gender: \(charStruct?.genderOfCh ?? "-")")
        infoArray.append("Origin place: \(charStruct?.originPlace ?? "-")")
        infoArray.append("Current location: \(charStruct?.currenlocation ?? "-")")
        
        var image = UIImage()
        do {
            if let url = URL(string: charStruct!.imageOfCh) {
                let data = try Data(contentsOf: url)
                image = UIImage(data: data)!
                self.imageView = UIImageView(image: image)
                self.createImage()
            }
            else {
                imageView.backgroundColor = .systemGray
            }
        } catch {
            print(error)
        }
    }
    
    private func createImage() {
        view.addSubview(imageView)
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
        myScrollView.backgroundColor = .systemGreen
    }
    
    private func setupLabel() {
        myScrollView.addSubview(nameLabel)
        nameLabel.text = "\(characterNameTitle)"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        nameLabel.textAlignment = .natural
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        
        setLabelConstrains()
    }
    
    private func setLabelConstrains() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
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
    
    private func setupStack(){
        myStackView.axis = .vertical
        myStackView.distribution = .fillEqually
        myStackView.alignment = .fill
        myStackView.spacing = 10
        myStackView.backgroundColor = .systemYellow
        view.addSubview(myStackView)
        setStackViewConstrains()
    }
    
    private func makeLabelArray() {
        var labelArray = [UILabel]()
        for labelValue in infoArray {
            labelArray += [createLabel(withColor: .systemGray, title: labelValue)]
        }
        
        myStackView = UIStackView(arrangedSubviews: labelArray)
        setupStack()
    }
}
