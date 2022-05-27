//
//  UserComment.swift
//  newProject
//
//  Created by Толканица Дарья Юрьевна on 27.05.2022.
//

import Foundation

final class UserComment {
    
    private enum CommentKeys: String {
        case userModel
    }
    
    static var userModel: UserModel? {
        get {
            if let data = UserDefaults.standard.object(forKey: CommentKeys.userModel.rawValue) as? Data {
                let user = try? JSONDecoder().decode(UserModel.self, from: data)
                return user
            }
            return nil
        } set {
            let defaults = UserDefaults.standard
            if newValue == nil {
                defaults.removeObject(forKey: CommentKeys.userModel.rawValue)
            } else {
            // в отличие от простого объекта (string, int и тд), объект типа UserModel нельзя просто вставить внутрь UsedDefaults, нужно сначала с помощью специального класса переконвертировать объект в дату и только потом вставить внутрь UsedDefaults
                let data = try? JSONEncoder().encode(newValue)
                defaults.setValue(data, forKey: CommentKeys.userModel.rawValue)
            }
        }
    }
}
