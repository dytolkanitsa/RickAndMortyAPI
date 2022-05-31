//
//  DetailViewController.swift
//  newProject
//
//  Created by Дарья Толканица on 29.04.2022.
//

import UIKit

final class DetailViewController: UIViewController {

    private lazy var characterId = Int()
    private lazy var infoArray = [String]()
    var character: CharacterData?
    
    private let detailScrollView: UIScrollView = {
        let detailScrollView = UIScrollView()
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        return detailScrollView
    }()
    
    private let detailStackView: UIStackView = {
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
    
    private let imageViewContainer: UIView = {
        let imageViewContainer = UIView()
        imageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        return imageViewContainer
    }()
    
    private let imageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = appColors.birch
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nameLabel.font = appFonts.characterNameTitle
        nameLabel.textColor = appColors.fountainBlue
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    private let textFieldStack: UIStackView = {
        let textFieldStack = UIStackView()
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        textFieldStack.backgroundColor = appColors.systemMint
        textFieldStack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        textFieldStack.clipsToBounds = true
        textFieldStack.layer.cornerRadius = 10
        textFieldStack.axis = .vertical
        textFieldStack.distribution = .fill
        textFieldStack.alignment = .fill
        textFieldStack.spacing = 15
        textFieldStack.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        textFieldStack.isLayoutMarginsRelativeArrangement = true
        return textFieldStack
    }()
    
    private let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.backgroundColor = appColors.systemPink
        nameTextField.textColor = appColors.white
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        nameTextField.font = appFonts.infoLabetsFonts
        nameTextField.clipsToBounds = true
        nameTextField.layer.cornerRadius = 10
        return nameTextField
    }()
    
    private let commentTextField: UITextField = {
        let commentTextField = UITextField()
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.heightAnchor.constraint(equalToConstant: 150).isActive = true
        commentTextField.backgroundColor = appColors.systemPink
        commentTextField.textColor = appColors.white
        commentTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        commentTextField.font = appFonts.infoLabetsFonts
        commentTextField.clipsToBounds = true
        commentTextField.layer.cornerRadius = 10
        return commentTextField
    }()
    
    private let saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        saveButton.backgroundColor = appColors.systemBlue
        saveButton.layer.cornerRadius = 15
        saveButton.setTitle("Save", for: .normal)
        return saveButton
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
        
        guard let nameText = UserComment.userModel?.name, let commentText = UserComment.userModel?.comment else {return}
        nameTextField.text = nameText
        commentTextField.text = commentText
        
        setupScrollConstraints()
        setupStackConstraints()
        setupImageViewConstraints()
        setupNameLabelText()
        setupDataIntoArray()
        putLabelsInStack()
        
        setupButton()
    }
    
    private func setupButton() {
        saveButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        guard let nameText = nameTextField.text, let commentText = commentTextField.text else {return}
        let userObject = UserModel(name: nameText, comment: commentText)
        UserComment.userModel = userObject
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
        
        characterId = character.id

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
    
    private func createStack(withColor color: UIColor, title: String) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalToConstant: 55).isActive = true
        stack.backgroundColor = color
        stack.layer.cornerRadius = 10
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill

        let imageFem: UIImageView = {
            let imageFem = UIImageView()
            imageFem.translatesAutoresizingMaskIntoConstraints = false
            imageFem.backgroundColor = .systemMint
            imageFem.widthAnchor.constraint(equalToConstant: 30).isActive = true
            imageFem.image = UIImage(named: "female")
            return imageFem
        }()

        let imageMale: UIImageView = {
            let imageMale = UIImageView()
            imageMale.translatesAutoresizingMaskIntoConstraints = false
            imageMale.backgroundColor = .systemMint
            imageMale.widthAnchor.constraint(equalToConstant: 30).isActive = true
            imageMale.image = UIImage(named: "male")
            return imageMale
        }()
        
        stack.addArrangedSubview(createLabel(withColor: .systemCyan, title: title))
        
        if title.contains("Female") {
    
            stack.addArrangedSubview(imageFem)
            imageFem.contentMode = .scaleAspectFit
        }
        
        if title.contains("Male") {

            stack.addArrangedSubview(imageMale)
            imageMale.contentMode = .scaleAspectFit
        }
        
        return stack
    }
    
    private func putLabelsInStack() {
        detailStackView.addArrangedSubview(nameLabel)
        detailStackView.addArrangedSubview(imageViewContainer)
        detailStackView.setCustomSpacing(30, after: imageViewContainer)
        imageView.contentMode = .scaleAspectFill
        
        var stack = UIStackView()
        for labelValue in infoArray {
            stack = createStack(withColor: appColors.ming ?? .white, title: labelValue)
            detailStackView.addArrangedSubview(stack)
        }
        
        detailStackView.setCustomSpacing(30, after: stack)
        detailStackView.addArrangedSubview(textFieldStack)
        detailStackView.addArrangedSubview(saveButton)
        
        textFieldStack.addArrangedSubview(nameTextField)
        textFieldStack.addArrangedSubview(commentTextField)
        
    }
}
