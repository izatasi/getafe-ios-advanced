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
    @objc dynamic var latitude: String?

    override static func primaryKey() -> String? {
        return "uuid"
    }
    
    convenience init(uuid: String,
                     avatar: String? = nil,
                     firstname: String? = nil,
                     lastname: String? = nil,
                     email: String? = nil,
                     gender: String? = nil,
                     birthdate: Date? = nil,
                     country: String? = nil,
                     latitude: String? = nil,
                     longitude: String? = nil) {
        
        self.init()
        
        self.uuid = uuid
        self.avatar = avatar
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.gender = gender
        self.birthdate = birthdate
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        
    }
}

