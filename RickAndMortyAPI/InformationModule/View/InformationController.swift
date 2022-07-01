//
//  RandomCharacter.swift
//  newProject
//
//  Created by Толканица Дарья on 23.05.2022.
//

import UIKit

final class InformationController: UIViewController {
    
    var output: InformationOutputProtocol?
    
    private let catsScrollView: UIScrollView = {
        let catsScrollView = UIScrollView()
        catsScrollView.translatesAutoresizingMaskIntoConstraints = false
        return catsScrollView
    }()
    
    private let catsStackView: UIStackView = {
        let catsStackView = UIStackView()
        catsStackView.translatesAutoresizingMaskIntoConstraints = false
        catsStackView.backgroundColor = appColors.birch
        
        catsStackView.axis = .vertical
        catsStackView.distribution = .fill
        catsStackView.alignment = .fill
        catsStackView.spacing = 10
        catsStackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        catsStackView.isLayoutMarginsRelativeArrangement = true
        return catsStackView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = appColors.systemYellow
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleLabel.font = appFonts.infoLabetsFonts
        titleLabel.textColor = appColors.systemPink
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let secondCollection: InformationCollectionView = {
        let secondCollection = InformationCollectionView()
        secondCollection.heightAnchor.constraint(equalToConstant: 350).isActive = true
        secondCollection.isPagingEnabled = true
        return secondCollection
    }()
    
    private let countLabel: UILabel = {
        let countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countLabel.textAlignment = .left
        countLabel.text = "1 of 3"
        countLabel.textColor = .white
        countLabel.font = appFonts.imageCountLabel
        return countLabel
    }()
    
    private let infornaionLabel: UILabel = {
        let infornaionLabel = UILabel()
        infornaionLabel.translatesAutoresizingMaskIntoConstraints = false
        infornaionLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        infornaionLabel.clipsToBounds = true
        infornaionLabel.layer.cornerRadius = 10
        infornaionLabel.backgroundColor = .systemMint
        return infornaionLabel
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
        appearance.titleTextAttributes = [.foregroundColor: appColors.systemPink ?? appColors.black]
    
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
    
    private func setup() {
        setupScrollConstraints()
        setupStackConstraints()
        putThingsInStack()
        guard let output = output else {
            return
        }
        secondCollection.set(cells: CatsImages.fetchCats(), presenter: output)
    }
    
    private func setupScrollConstraints() {
        view.addSubview(catsScrollView)
        
        NSLayoutConstraint.activate([
            catsScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            catsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            catsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            catsScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func setupStackConstraints() {
        catsScrollView.addSubview(catsStackView)
        NSLayoutConstraint.activate([
            catsStackView.topAnchor.constraint(equalTo: catsScrollView.topAnchor),
            catsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            catsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            catsStackView.bottomAnchor.constraint(equalTo: catsScrollView.bottomAnchor)])
    }
    
    private func putThingsInStack() {
        catsStackView.addArrangedSubview(titleLabel)
        catsStackView.setCustomSpacing(20, after: titleLabel)
        catsStackView.addArrangedSubview(secondCollection)
        catsStackView.addArrangedSubview(countLabel)
        catsStackView.addArrangedSubview(infornaionLabel)
    }
}

extension InformationController: InformationInputProtocol {
    
    
    func showLabelText() {
        titleLabel.text = "Daria Tolkanitsa"
    }
    
    func showNumberOfCell(index: Int, numberOfCells: Int) {
        countLabel.text = "\(index + 1)" + " of " + "\(numberOfCells)"
    }
}
