//
//  ViewController.swift
//  newProject
//
//  Created by Дарья Толканица on 27.04.2022.
//

import UIKit
import Foundation

// архитектура mvc mvp solid
// ui: safe ared layout marg traid coll , stack ui tutorial
// шрифты рик и морти (цвета) +
// статус неизвестно/жив/мертв микрокартинки
// аудио(?)
// локализация +
// еще один контроллер /системные преколы рандомный персонаж по кнопке
// force unwrap

// кое-где выходит за пределы лэйбла (аврадольв линкер)

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewVC = TableViewController()
        let randomChVC = RandomCharacterVC()
        _ = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 10)]
        
        tableViewVC.title = NSLocalizedString("[Characters]", comment: "")
        randomChVC.title = NSLocalizedString("[Random character]", comment: "")
        self.setViewControllers([tableViewVC, randomChVC], animated: false)
//        self.tabBar.backgroundColor = UIColor(red: 90/255, green: 193/255, blue: 184/255, alpha: 1)
        guard let items = self.tabBar.items else {return}
        
        let images = ["rick", "morty"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(named: images[x])?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationBar = self.navigationController?.navigationBar
        navigationItem.title = NSLocalizedString("[Characters]", comment: "")
        _ = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 10)]
        navigationBar?.backgroundColor = .black
        navigationBar?.barStyle = UIBarStyle.black
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}


final class TableViewController: UIViewController {
    
    private var response: SearchResponse? = nil
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .black
        tableView.separatorColor = UIColor(red: 190/255, green: 215/255, blue: 177/255, alpha: 1)
        setupTableView()
        fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.backgroundColor = .black
        navigationBar?.barStyle = UIBarStyle.black
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }

    
    private func fetchData() {
        let nerworkCharacterManager = NetworkManager()
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
    private func setupTableView() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.backgroundColor = .black
        setupTableViewConstraints()
    }

    private func setupTableViewConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
//        title = NSLocalizedString("Characters", comment: "")
    }
}

    // MARK: - UITableViewDataSource
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let character = response?.results[indexPath.row]
        cell.set(character: character!)
        // чтобы сепаратор не пропадал при выборе
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let characterObj = response?.results[indexPath.row]
            let characterVC = DetailViewController()
            characterVC.modalPresentationStyle = .fullScreen
            characterVC.character = characterObj
            self.navigationController?.pushViewController(characterVC, animated: true)
        }
    }
}
