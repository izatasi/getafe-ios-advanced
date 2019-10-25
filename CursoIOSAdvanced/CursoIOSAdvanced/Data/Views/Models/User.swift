//
//  User.swift
//  CursoIOSAdvanced
//
//  Created by David Jardon on 08/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation


class User {
    let id: String
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let title: String?
    let gender: String?
    let email: String?
    let landline: String?
    let mobile: String?
    let birthdate: Date?
    let country: String?
    let state: String?
    let city: String?
    let address: String?
    let nationality: String?
    let latitude: String?
    let longitude: String?

    var name: String {
        var userName = ""
        if let userFirstName = firstName {
            userName += userFirstName
        }
        
        if let userLastName = lastName {
            userName += (userName.count > 0 ? " \(userLastName)": userLastName)
        }
        
        return "\(userName)"
    }
    
    var age: Int {
        guard let date = birthdate,
              let yearAge = Calendar.current.dateComponents([.year],
                                                                  from: date, to: Date()).year else {
            return 0
        }
        
        return yearAge
    }
    
    
    
    init(id: String, avatar: String? = nil, firstName: String? = nil, lastName: String? = nil, title: String? = nil, gender: String? = nil, email: String? = nil, landline: String? = nil, mobile: String? = nil, birthdate: Date? = nil, country: String? = nil, state: String? = nil, city: String? = nil, address: String? = nil, nationality: String? = nil, latitude: String? = nil, longitude: String? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.title = title
        self.gender = gender
        self.email = email
        self.landline = landline
        self.mobile = mobile
        self.birthdate = birthdate
        self.country = country
        self.state = state
        self.city = city
        self.address = address
        self.nationality = nationality
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
