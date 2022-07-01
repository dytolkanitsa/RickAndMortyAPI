//
//  Resouces.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 25.05.2022.
//

import Foundation
import UIKit

enum appColors {
    
    // custom colors
    // Riack And Morty
    static let sprout = UIColor(named: "sprout")
    static let birch = UIColor(named: "birch")
    static let fountainBlue = UIColor(named: "fountainBlue")
    static let ming = UIColor(named: "ming")
    static let mountainMist = UIColor(named: "mountainMist")
    static let chatelle = UIColor(named: "chatelle")
    static let peppermint = UIColor(named: "peppermint")
    static let lavenderRose = UIColor(named: "lavenderRose")
    
    // Evangelion
    static let enegryBlock = UIColor(named: "enegryBlock")
    static let freshApple = UIColor(named: "freshApple")
    static let grape = UIColor(named: "grape")
    static let lilac = UIColor(named: "lilac")
    
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
    static let imageCountLabel = UIFont(name: "HelveticaNeue-CondensedBold", size: 13)
}

enum appLocalization {
    
    static func localization(key keyString: String) -> String {
        NSLocalizedString(keyString, comment: "")
    }
}
