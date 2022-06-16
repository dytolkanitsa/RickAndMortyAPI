//
//  DetailViewPresenter.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 01.06.2022.
//

import Foundation
import UIKit

final class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: WorkWithRawDetailData?
    var interactor: InteractorDetailOutputProtocol?
    var character: DetailInformation?

    private lazy var characterId = Int()
    private lazy var infoArray = [String]()
    
    init(view: WorkWithRawDetailData, interactor: InteractorDetailOutputProtocol, character: DetailInformation?) {
        self.view = view
        self.character = character
        self.interactor = interactor
        putDataIntoArray()
    }
    
    func viewDidLoad() {
        view?.displayTitle(name: character?.name)
        findComment()
    }
    
    func findComment() {
        for num in 0..<UserComment.userModel.count {
            if UserComment.userModel[num].id == character?.id{
                view?.presentComment(userModel: UserComment.userModel[num])
            }
        }
    }
    
    func putDataIntoArray() {
        interactor?.putDataInArray(character, completion: { [weak self] infoArr, chId in
            guard let infoArr1 = infoArr, let charId = chId else { return }
            self?.infoArray = infoArr1
            self?.characterId = charId
        })
        
        view?.setupDataIntoArray(character: character, infoArray)
    }
}
