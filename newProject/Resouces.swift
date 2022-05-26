//
//  Resouces.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 25.05.2022.
//

import Foundation
import UIKit

enum appColors {
    
    // custom
    static let sprout = UIColor(red: 190/255, green: 215/255, blue: 177/255, alpha: 1)
    static let birch = UIColor(red: 55/255, green: 48/255, blue: 39/255, alpha: 1)
    static let fountainBlue = UIColor(red: 90/255, green: 193/255, blue: 184/255, alpha: 1)
    static let ming = UIColor(red: 63/255, green: 128/255, blue: 136/255, alpha: 1)
    static let mountainMist = UIColor(red: 155/255, green: 142/255, blue: 160/255, alpha: 1)
    static let chatelle = UIColor(red: 196/255, green: 180/255, blue: 202/255, alpha: 1)
    
    // appColors
    static let black = UIColor.black
    static let white = UIColor.white
    static let gray = UIColor.gray
    static let systemCyan = UIColor.systemCyan
    static let systemGreen = UIColor.systemGreen
    static let systemMint = UIColor.systemMint
    static let systemYellow = UIColor.systemYellow
    static let systemPink = UIColor.systemPink
    static let systemBlue = UIColor.systemBlue
    
}

enum appFonts {
    static let infoLabetsFonts = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
    static let characterNamesTable = UIFont(name: "GetSchwifty-Regular", size: 20)
    static let characterNameTitle = UIFont(name: "GetSchwifty-Regular", size: 35)
}

enum appLocalization {
    
    func localization(key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}
