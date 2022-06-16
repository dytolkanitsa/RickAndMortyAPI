//
//  Interactor.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 16.06.2022.
//

import Foundation
import UIKit

protocol InteractorDetailInputProtocol: AnyObject {
    
}

protocol InteractorDetailOutputProtocol: AnyObject {
    func putDataInArray(_ character: DetailInformation?, completion: @escaping ([String]?, Int?) -> Void)
}

final class InteractorDetailView: InteractorDetailOutputProtocol {
    private lazy var characterId = Int()
    private lazy var infoArray = [String]()
    
    func putDataInArray(_ character: DetailInformation?, completion: @escaping ([String]?, Int?) -> Void) {
        guard let character = character else { return }
        characterId = character.id

        infoArray.append(appLocalization.localization(key: "Name: ") + appLocalization.localization(key: character.name))
        infoArray.append(appLocalization.localization(key: "Status: ") + appLocalization.localization(key: character.status))
        infoArray.append(appLocalization.localization(key: "Type: ") + appLocalization.localization(key: character.species))
        infoArray.append(appLocalization.localization(key: "Species: ") + appLocalization.localization(key: character.type))
        infoArray.append(appLocalization.localization(key: "Gender: ") + appLocalization.localization(key: character.gender))
        infoArray.append(appLocalization.localization(key: "Origin place: ") + appLocalization.localization(key: character.origin))
        infoArray.append(appLocalization.localization(key: "Current location: ") + appLocalization.localization(key: character.location))
        completion(infoArray, characterId)
    }
}
