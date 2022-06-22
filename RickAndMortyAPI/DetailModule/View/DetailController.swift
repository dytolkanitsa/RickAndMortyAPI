//
//  DetailViewController.swift
//  newProject
//
//  Created by Дарья Толканица on 29.04.2022.
//

import UIKit

final class DetailController: UIViewController {

    var output: DetailOutputProtocol?
    var characterId = Int()
    var infoArray = [String]()
    
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
        detailStackView.layoutMargins = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        detailStackView.isLayoutMarginsRelativeArrangement = true
        return detailStackView
    }()
    
    private let imageViewContainer: UIView = {
        let imageViewContainer = UIView()
        imageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        return imageViewContainer
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
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
        textFieldStack.backgroundColor = appColors.chatelle
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
        nameTextField.backgroundColor = appColors.lavenderRose
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
        commentTextField.backgroundColor = appColors.lavenderRose
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
    
    private let informationLabelsStack: UIStackView = {
        let informationLabelsStack = UIStackView()
        informationLabelsStack.translatesAutoresizingMaskIntoConstraints = false
        informationLabelsStack.backgroundColor = appColors.birch
        informationLabelsStack.axis = .vertical
        informationLabelsStack.distribution = .fill
        informationLabelsStack.alignment = .fill
        informationLabelsStack.spacing = 10
        informationLabelsStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        informationLabelsStack.isLayoutMarginsRelativeArrangement = true
        return informationLabelsStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appColors.birch
        setup()
        output?.viewDidLoad()
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
        putLabelsInStack()
        
        setupButton()
    }
    
    private func setupButton() {
        saveButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        saveButton.shake()
        guard let nameText = nameTextField.text, let commentText = commentTextField.text else {
            return
        }
        output?.saveButtonTapped(nameText, commentText)
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
    
    private func createStackForLabel(withColor color: UIColor, title: String) -> UIStackView {
    
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalToConstant: 55).isActive = true
        stack.backgroundColor = color
        stack.layer.cornerRadius = 10
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        
        stack.addArrangedSubview(createLabel(withColor: color, title: title))
        
        return stack
    }
    
    private func putLabelsInStack() {
        detailStackView.addArrangedSubview(nameLabel)
        detailStackView.addArrangedSubview(imageViewContainer)
        detailStackView.setCustomSpacing(30, after: imageViewContainer)
        imageView.contentMode = .scaleAspectFill
        
        detailStackView.addArrangedSubview(informationLabelsStack)
        detailStackView.addArrangedSubview(textFieldStack)
        detailStackView.addArrangedSubview(saveButton)
        
        textFieldStack.addArrangedSubview(nameTextField)
        textFieldStack.addArrangedSubview(commentTextField)
        
    }
}

extension DetailController: DetailInputProtocol {
    
    func displayTitle(name: String) {
        nameLabel.text = appLocalization.localization(key: name)
    }
    
    func displayImage(image: UIImage) {
        imageView.image = image
    }
    
    func displayComment(userModel: UserModel) {
        nameTextField.text = userModel.name
        commentTextField.text = userModel.comment
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Failed to upload image", message: "Please reload page", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) in print("OK button was pressed")}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func createLabelsStack() {
        var stack = UIStackView()
        for labelValue in infoArray {
            stack = createStackForLabel(withColor: appColors.ming ?? .white, title: labelValue)
            informationLabelsStack.addArrangedSubview(stack)
        }
    }
    
}
