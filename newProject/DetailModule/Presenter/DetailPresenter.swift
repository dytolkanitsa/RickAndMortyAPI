//
//  DetailViewPresenter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 01.06.2022.
//

import UIKit

final class DetailPresenter: DetailOutputProtocol {
    
    weak var view: DetailInputProtocol?
    var interactor: DetailInteractorInputProtocol?
    var character: DetailInformation?

    private lazy var characterId = Int()
    private lazy var infoArray = [String]()
    
    init(view: DetailInputProtocol, interactor: DetailInteractorInputProtocol, character: DetailInformation?) {
        self.view = view
        self.character = character
        self.interactor = interactor
        putDataIntoArray()
        getImage()
    }
    
    func viewDidLoad() {
        guard let character = character else { return }
        view?.displayTitle(name: character.name)
        findComment()
    }
    
    func saveButtonTapped(_ name: String, _ comment: String) {
        interactor?.saveComment(characterId, name, comment)
    }
    
    func findComment() {
        guard let character = character else { return }
        UserCommentService.userModel.enumerated().forEach({ index, item in
            
            if UserCommentService.userModel[index].id == character.id{
                view?.displayComment(userModel: UserCommentService.userModel[index])
            }
        })
    }
    
    func putDataIntoArray() {
        
        guard let character = character else { return }
        // создать в моменте передачи во вью
        infoArray.append(appLocalization.localization(key: "Name: ") + appLocalization.localization(key: character.name))
        infoArray.append(appLocalization.localization(key: "Status: ") + appLocalization.localization(key: character.status))
        infoArray.append(appLocalization.localization(key: "Type: ") + appLocalization.localization(key: character.species))
        infoArray.append(appLocalization.localization(key: "Species: ") + appLocalization.localization(key: character.type))
        infoArray.append(appLocalization.localization(key: "Gender: ") + appLocalization.localization(key: character.gender))
        infoArray.append(appLocalization.localization(key: "Origin place: ") + appLocalization.localization(key: character.origin))
        infoArray.append(appLocalization.localization(key: "Current location: ") + appLocalization.localization(key: character.location))
        
        view?.infoArray = infoArray
        view?.characterId = character.id
    }
    
    func getImage() {
        
        guard let character = character else { return }
        guard let url = URL(string: character.image) else { return }
        
        interactor?.loadImage(url: url, completion: { result in
            switch result {
            case .success(let image):
                guard let image = image else { return }
                self.view?.displayImage(image: image)
            case .failure(let error):
                self.view?.showError(error: error)
            }
        })
    }
    
}
