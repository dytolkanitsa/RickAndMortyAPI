//
//  DetailViewController.swift
//  newProject
//
//  Created by Дарья Толканица on 29.04.2022.
//

import UIKit

final class DetailViewController: UIViewController {

    private var infoArray = [String]()
    var character: CharacterData?
    
    private var detailScrollView: UIScrollView = {
        let detailScrollView = UIScrollView()
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        return detailScrollView
    }()
    
    private var detailStackView: UIStackView = {
        let detailStackView = UIStackView()
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.backgroundColor = appColors.birch
        
        detailStackView.axis = .vertical
        detailStackView.distribution = .fill
        detailStackView.alignment = .fill
        detailStackView.spacing = 10
        detailStackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        detailStackView.isLayoutMarginsRelativeArrangement = true
        return detailStackView
    }()
    
    private var imageViewContainer: UIView = {
        let imageViewContainer = UIView()
        imageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        return imageViewContainer
    }()
    
    private var imageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = appColors.birch
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nameLabel.font = appFonts.characterNameTitle
        nameLabel.textColor = appColors.fountainBlue
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appColors.birch
        
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = appColors.sprout
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationItem.title = "[Information]"
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
    
    private func setup() {
        setupScrollConstraints()
        setupStackConstraints()
        setupImageViewConstraints()
        setupNameLabelText()
        setupDataIntoArray()
        putLabelsInStack()
    }
    
    private func setupScrollConstraints() {
        view.addSubview(detailScrollView)
        
        NSLayoutConstraint.activate([
            detailScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func setupStackConstraints() {
        detailScrollView.addSubview(detailStackView)

        NSLayoutConstraint.activate([
            detailStackView.topAnchor.constraint(equalTo: detailScrollView.topAnchor),
            detailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailStackView.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor)])

    }
    
    private func setupImageViewConstraints() {
        imageViewContainer.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageViewContainer.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageViewContainer.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageViewContainer.bottomAnchor)])
    }

    private func setupNameLabelText() {
        guard let character = character else {
            return
        }
        nameLabel.text = appLocalization.localization(key: character.name)
    }
    
    private func setupDataIntoArray() {
        guard let character = character else {
            return
        }

        infoArray.append(appLocalization.localization(key: "Name: ") + appLocalization.localization(key: character.name))
        infoArray.append(appLocalization.localization(key: "Status: ") + appLocalization.localization(key: character.status.rawValue))
        infoArray.append(appLocalization.localization(key: "Type: ") + appLocalization.localization(key: character.species.rawValue))
        infoArray.append(appLocalization.localization(key: "Species: ") + appLocalization.localization(key: character.type))
        infoArray.append(appLocalization.localization(key: "Gender: ") + appLocalization.localization(key: character.gender.rawValue))
        infoArray.append(appLocalization.localization(key: "Origin place: ") + appLocalization.localization(key: character.origin.name))
        infoArray.append(appLocalization.localization(key: "Current location: ") + appLocalization.localization(key: character.location.name))
        
        
        if let url = URL(string: character.image) {
            imageView.loadImage(from: url)
        }
    }
    
    private func createLabel(withColor color: UIColor, title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 55).isActive = true
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = " \(title)"
        label.font = appFonts.infoLabetsFonts
        label.backgroundColor = color
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.textColor = appColors.white
        return label
    }
    
    private func putLabelsInStack() {
        detailStackView.addArrangedSubview(nameLabel)
        detailStackView.addArrangedSubview(imageViewContainer)
        imageView.contentMode = .scaleAspectFill
        for labelValue in infoArray {
            detailStackView.addArrangedSubview(createLabel(withColor: appColors.ming ?? .white, title: labelValue))
        }
    }
}
