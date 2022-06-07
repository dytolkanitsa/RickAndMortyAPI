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
    var character: DetailInformation?

    init(view: WorkWithRawDetailData, character: DetailInformation?) {
        self.view = view
        self.character = character
        view.setupDataIntoArray(character: character)
    }
    
    func findComment() {
        for num in 0..<UserComment.userModel.count {
            if UserComment.userModel[num].id == character?.id{
                view?.presentComment(userModel: UserComment.userModel[num])
            }
        }
    }
}
