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
    private var imageView = CustomImageView()
    private var nameLabel = UILabel()
    private var infoArray = [String]()
    var character: CharacterData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 190/255, green: 215/255, blue: 177/255, alpha: 1)
        self.navigationItem.title = NSLocalizedString("[Information]", comment: "")
        _ = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 10)]
        setupScroll()
        setupStack()
        setupImage()
        setupNameLabel()
        setupData()
        putLabelsInStack()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barStyle = UIBarStyle.default
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        navigationBar?.backgroundColor = UIColor(red: 190/255, green: 215/255, blue: 177/255, alpha: 1)
    }
    
    private func setupScroll() {
        view.addSubview(myScrollView)
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        myScrollView.backgroundColor = .systemMint
        
        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func setupStack() {
        myScrollView.addSubview(myStackView)
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.backgroundColor = UIColor(red: 55/255, green: 48/255, blue: 39/255, alpha: 1)

        NSLayoutConstraint.activate([
            myStackView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            myStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myStackView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor)])
        
        myStackView.axis = .vertical
        myStackView.distribution = .fill
        myStackView.alignment = .fill
        myStackView.spacing = 10
        myStackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        myStackView.isLayoutMarginsRelativeArrangement = true
    }
    
    private func setupImage() {
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        imageView.backgroundColor = UIColor(red: 55/255, green: 48/255, blue: 39/255, alpha: 1)
        imageView.backgroundColor = .systemMint
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
    }
    
    private func setupNameLabel() {
        nameLabel.backgroundColor = UIColor(red: 55/255, green: 48/255, blue: 39/255, alpha: 1)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nameLabel.font = UIFont(name: "GetSchwifty-Regular", size: 35)
        nameLabel.textColor = UIColor(red: 90/255, green: 193/255, blue: 184/255, alpha: 1)
        guard let character = character else {
            return
        }
        nameLabel.text = NSLocalizedString(character.name, comment: "")
        nameLabel.textAlignment = .center
    }
    
    private func setupData() {
        guard let character = character else {
            return
        }
        infoArray.append(NSLocalizedString("Name: ", comment: "") + NSLocalizedString(character.name, comment: ""))
        infoArray.append(NSLocalizedString("Status: ", comment: "") + NSLocalizedString(character.status.rawValue, comment: ""))
        infoArray.append(NSLocalizedString("Type: ", comment: "") + NSLocalizedString(character.species.rawValue, comment: ""))
        infoArray.append(NSLocalizedString("Species: ", comment: "") + NSLocalizedString(character.type, comment: ""))
        infoArray.append(NSLocalizedString("Gender: ", comment: "") + NSLocalizedString(character.gender.rawValue, comment: ""))
        infoArray.append(NSLocalizedString("Origin place: ", comment: "") + NSLocalizedString(character.origin.name, comment: ""))
        infoArray.append(NSLocalizedString("Current location: ", comment: "") + NSLocalizedString(character.location.name, comment: ""))
        
        if let url = URL(string: character.image) {
            imageView.loadImage(from: url)
        }
    }
    
    private func createLabel(withColor color: UIColor, title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 55).isActive = true
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
        label.backgroundColor = color
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.text = " \(title)"
        label.textColor = .white
//        label.addImageWith(name: "мужчина", behindText: false)
        return label
    }
    
    private func putLabelsInStack() {
        myStackView.addArrangedSubview(nameLabel)
        myStackView.addArrangedSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        for labelValue in infoArray {
            myStackView.addArrangedSubview(createLabel(withColor: UIColor(red: 63/255, green: 128/255, blue: 136/255, alpha: 1), title: labelValue))
        }
    }
}

//extension UILabel {
//
//    func addImageWith(name: String, behindText: Bool) {
//
//        let attachment = NSTextAttachment()
//        attachment.image = UIImage(named: name)
//        let attachmentString = NSAttributedString(attachment: attachment)
//
//        guard let txt = self.text else {
//            return
//        }
//
//        if behindText {
//            let strLabelText = NSMutableAttributedString(string: txt)
//            strLabelText.append(attachmentString)
//            self.attributedText = strLabelText
//        } else {
//            let strLabelText = NSAttributedString(string: txt)
//            let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
//            mutableAttachmentString.append(strLabelText)
//            self.attributedText = mutableAttachmentString
//        }
//    }
//
//    func removeImage() {
//        let text = self.text
//        self.attributedText = nil
//        self.text = text
//    }
//}
