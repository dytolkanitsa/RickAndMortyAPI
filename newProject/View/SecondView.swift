//
//  RandomCharacter.swift
//  newProject
//
//  Created by Толканица Дарья on 23.05.2022.
//

import UIKit

struct UserModel: Codable {
    var name: String
    var comment: String
}

final class SecondView: UIViewController {
    
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
    
    private var textFieldStack: UIStackView = {
        let textFieldStack = UIStackView()
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        textFieldStack.backgroundColor = .systemMint
        textFieldStack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        textFieldStack.axis = .vertical
        textFieldStack.distribution = .fill
        textFieldStack.alignment = .fill
        textFieldStack.spacing = 15
        textFieldStack.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        textFieldStack.isLayoutMarginsRelativeArrangement = true
        return textFieldStack
    }()
    
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .systemYellow
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleLabel.font = appFonts.characterNameTitle
        titleLabel.textColor = appColors.fountainBlue
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.backgroundColor = .systemPink
        nameTextField.textColor = .white
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        nameTextField.font = appFonts.infoLabetsFonts
        return nameTextField
    }()
    
    private var commentTextField: UITextField = {
        let commentTextField = UITextField()
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.heightAnchor.constraint(equalToConstant: 150).isActive = true
        commentTextField.backgroundColor = .systemPink
        commentTextField.textColor = .white
        commentTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        commentTextField.font = appFonts.infoLabetsFonts
        return commentTextField
    }()
    
    private var secondCollection: GalleryCollectionView = {
        let secondCollection = GalleryCollectionView()
        secondCollection.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return secondCollection
    }()
    
    private var saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 15
        saveButton.setTitle("Save", for: .normal)
        return saveButton
    }()
    
    let usedDefaults = UserDefaults.standard
    
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
        navigationItem.title = "[Cats]"
    
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
    
    private func setup() {
        
        if let name1 = usedDefaults.object(forKey: "name") {
            nameTextField.text = name1 as? String
        }
        
        if let comment1 = usedDefaults.object(forKey: "comment") {
            commentTextField.text = comment1 as? String
        }
        
        setupScrollConstraints()
        setupStackConstraints()
        setupButton()
        
        putThingsInStack()
        secondCollection.set(cells: Cats.fetchCats())
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
    
    private func setupButton() {
        saveButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        print("tab")
        print(commentTextField.text!)

        usedDefaults.setValue(nameTextField.text!, forKey: "name")
        usedDefaults.setValue(commentTextField.text!, forKey: "comment")
        commentTextField.resignFirstResponder()
    }
    
    private func putThingsInStack() {
        detailStackView.addArrangedSubview(titleLabel)
        detailStackView.setCustomSpacing(20, after: titleLabel)
        detailStackView.addArrangedSubview(secondCollection)
        detailStackView.setCustomSpacing(30, after: secondCollection)
        detailStackView.addArrangedSubview(textFieldStack)
        detailStackView.addArrangedSubview(saveButton)
        
        textFieldStack.addArrangedSubview(nameTextField)
        textFieldStack.addArrangedSubview(commentTextField)
    }
}
