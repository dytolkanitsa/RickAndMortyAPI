//
//  ViewController.swift
//  newProject
//
//  Created by Дарья Толканица on 27.04.2022.
//

import UIKit
import Foundation

final class TableViewController: UIViewController {
    
    var presenter: TableViewDataCoordination?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        
        table.separatorColor = appColors.sprout
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = appColors.black
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = appColors.fountainBlue
        appearance.titleTextAttributes = [.foregroundColor: appColors.black]
        
        let tabBarCont = navigationController?.tabBarController
        tabBarCont?.tabBar.barTintColor = appColors.fountainBlue
        tabBarCont?.tabBar.backgroundColor = appColors.fountainBlue

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
        
    private func setup() {
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints(){
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.resultsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        presenter?.putDataInCell(indexPath)
        guard let characterData = presenter?.cellData else { return cell }
        cell.set(character: characterData)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard tableView.indexPathForSelectedRow != nil else { return }
        presenter?.tableCellTapped(indexPath)
    }
    
    func pushNewView(_ view: UIViewController) {
        view.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(view, animated: true)
    }
}

extension TableViewController: TableViewParsingResults {
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print(error)
    }
}
