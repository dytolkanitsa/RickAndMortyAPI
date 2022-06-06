//
//  RandomCharacter.swift
//  newProject
//
//  Created by Толканица Дарья on 23.05.2022.
//

import UIKit

final class InformationViewController: UIViewController {
    
    var presenter: InformationViewPresenterProtocol?
    
    private let catsScrollView: UIScrollView = {
        let detailScrollView = UIScrollView()
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        return detailScrollView
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
    
    private let secondCollection: GalleryCollectionView = {
        let secondCollection = GalleryCollectionView()
        secondCollection.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return secondCollection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appColors.birch
        setup()
        presenter?.viewDidLoad()
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
        secondCollection.set(cells: CatsImages.fetchCats())
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
    }
}

extension InformationViewController: InformationViewProtocol {
    func showLabelText() {
        titleLabel.text = "Daria Tolkanitsa"
    }
}
