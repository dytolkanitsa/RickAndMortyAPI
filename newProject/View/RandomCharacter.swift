//
//  RandomCharacter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 23.05.2022.
//

import UIKit

final class RandomCharacterVC: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 155/255, green: 142/255, blue: 160/255, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationBar = self.navigationController?.navigationBar
        navigationItem.title = NSLocalizedString("[Random character]", comment: "")
        _ = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 10)]
        navigationBar?.barStyle = UIBarStyle.black
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBar?.backgroundColor = UIColor(red: 196/255, green: 180/255, blue: 202/255, alpha: 1)
    }
}
