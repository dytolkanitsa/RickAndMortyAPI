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
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
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
    
    private func setupTableView(){
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let character = response?.results[indexPath.row]
        cell.textLabel?.text = character?.name
        cell.textLabel?.numberOfLines = 0
        
        do {
            if let url = URL(string: character!.image) {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                cell.imageView?.image = image
            }
            else {
                cell.imageView?.backgroundColor = .systemGray
            }
        } catch {
            print(error)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let characterVC = DetailViewController()
            characterVC.modalPresentationStyle = .fullScreen
            let charactObj = response?.results[indexPath.row]
            guard let character = charactObj else { return }
            characterVC.characterNameTitle = character.name
            characterVC.characterInformation(character: character)
            self.navigationController?.pushViewController(characterVC, animated: true)
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
