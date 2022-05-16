//
//  Character.swift
//  newProject
//
//  Created by Дарья Толканица on 28.04.2022.
//

import Foundation
import UIKit

struct Character {
    let idOfCh: Int
    let nameOfCh: String
    let statusOfCh: String
    let speciesOfCh: String
    let typeOfCh: String
    let genderOfCh: String
    let originPlace: String
    let currenlocation: String
    let imageOfCh: String
    
    init?(characterData:  CharacterData) {
        idOfCh = characterData.id
        nameOfCh = characterData.name
        statusOfCh = characterData.status.rawValue
        speciesOfCh = characterData.species.rawValue
        typeOfCh = characterData.type
        genderOfCh = characterData.gender.rawValue
        originPlace = characterData.origin.name
        currenlocation = characterData.location.name
        imageOfCh = characterData.image
    }
}
