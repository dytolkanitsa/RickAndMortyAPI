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
    static let sprout = UIColor(named: "sprout")
    static let birch = UIColor(named: "birch")
    static let fountainBlue = UIColor(named: "fountainBlue")
    static let ming = UIColor(named: "ming")
    static let mountainMist = UIColor(named: "mountainMist")
    static let chatelle = UIColor(named: "chatelle")
    static let peppermint = UIColor(named: "peppermint")
    
    // appColors
    static let black = UIColor.black
    static let white = UIColor.white
    static let gray = UIColor.gray
    static let systemCyan = UIColor.systemCyan
    static let systemGreen = UIColor.systemGreen
    static let systemMint = UIColor.systemMint
    static let systemYellow = UIColor(named: "systemYellow")
    static let systemPink = UIColor(named: "systemPink")
    static let systemBlue = UIColor(named: "systemBlue")
    
}

enum appFonts {
    static let infoLabetsFonts = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
    static let characterNamesTable = UIFont(name: "GetSchwifty-Regular", size: 20)
    static let characterNameTitle = UIFont(name: "GetSchwifty-Regular", size: 35)
}

enum appLocalization {
    
    static func localization(key keyString: String) -> String {
        NSLocalizedString(keyString, comment: "")
    }
}
