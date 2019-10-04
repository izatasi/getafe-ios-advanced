//
//  UserDAO.swift
//  CursoIOS_Advanced
//
//  Created by Paulo Galeano on 04/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import UIKit
import RealmSwift

class UserDAO: Object{
    @objc dynamic var uuid: String = ""
    @objc dynamic var gender: String?
    @objc dynamic var firstname: String?
    @objc dynamic var lastname: String?
    @objc dynamic var country: String?
    @objc dynamic var email: String?
    @objc dynamic var birthdate: Date?
    @objc dynamic var avatar: String?
    @objc dynamic var longitude: String?
    @objc dynamic var lattitude: String?

    override static func primaryKey() -> String? {
        return "uuid"
    }
}

