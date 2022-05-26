//
//  RandomCharacter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 23.05.2022.
//

import UIKit

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
    
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = .systemYellow
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nameLabel.font = appFonts.characterNameTitle
        nameLabel.textColor = appColors.fountainBlue
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    private var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.backgroundColor = .systemPink
        return nameTextField
    }()
    
    private var commentTextField: UITextField = {
        let commentTextField = UITextField()
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.heightAnchor.constraint(equalToConstant: 150).isActive = true
        commentTextField.backgroundColor = .systemPink
        return commentTextField
    }()
    
    private var secondCollection: GalleryCollectionView = {
        let secondCollection = GalleryCollectionView()
        secondCollection.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return secondCollection
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
        navigationItem.title = "[Cats]"
    
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
    
    private func setup() {
        setupScrollConstraints()
        setupStackConstraints()

        putLabelsInStack()
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

    private func createLabel(withColor color: UIColor, title: Int) -> UILabel {
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
        label.textColor = .white
        return label
    }
    
    private func putLabelsInStack() {
        detailStackView.addArrangedSubview(nameLabel)
        detailStackView.setCustomSpacing(30, after: nameLabel)
        detailStackView.addArrangedSubview(secondCollection)
        detailStackView.setCustomSpacing(50, after: secondCollection)
        detailStackView.addArrangedSubview(textFieldStack)
        
        textFieldStack.addArrangedSubview(nameTextField)
        textFieldStack.addArrangedSubview(commentTextField)
    }
}
