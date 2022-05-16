//
//  ViewController.swift
//  newProject
//
//  Created by Дарья Толканица on 27.04.2022.
//

import UIKit
import Foundation

final class ViewController: UIViewController {
    
    private let nerworkCharacterManager = NetworkManager()
    private var response: SearchResponse? = nil
    private let searchController = UISearchController()
    var character: CharacterData? = nil
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 100
        return table
    }()
    
    override func viewDidLoad() {
        // always add UIView before setting constraints
        super.viewDidLoad()
        view.addSubview(tableView)
        
        setupTableView()
        setupSearchBar()
        
        let urlString = "https://rickandmortyapi.com/api/character"
        nerworkCharacterManager.fetchRMCharacters(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let searchResponse):
                self?.response = searchResponse
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    // MARK: - Setup View and SearchBar
    private func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        title = "Characters"
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
}

    // MARK: - UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        character = response?.results[indexPath.row]
        var image = UIImage()
        
        do {
            if let url = URL(string: character!.image) {
                let data = try Data(contentsOf: url)
                image = UIImage(data: data)!
            }
            else {
                cell.imageView?.backgroundColor = .systemGray
            }
        } catch {
            print(error)
        }
        cell.set(character: character!, image: image)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let characterVC = DetailViewController()
            characterVC.modalPresentationStyle = .fullScreen
            let charactObj = response?.results[indexPath.row]
            guard let character = charactObj else { return }
//            characterVC.characterNameTitle = character!.name
            characterVC.characterInformation(character: character)
            self.navigationController?.pushViewController(characterVC, animated: true)
        }
    }
}

    // MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
