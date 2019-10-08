//
//  User.swift
//  CursoIOS_Advanced
//
//  Created by Paulo Galeano on 08/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import Foundation

class User {
  
    let id: String?
    let firstname: String?
    let lastname: String?
    let avatar: String?
    let email: String?
    let birthdate: Date?
    let nacionality: String?
    let country: String?

    //variable calculada:
    var name: String {
        return "\(String(describing:firstname)) \(String(describing:lastname))"
    }
    
    // variable calculada: la edad actual
    var age: Int {
        
        guard let date = birthdate, let years = Calendar.current.dateComponents([.year], from: date, to: Date()).year else {
            return 0
        }
        
 //       let years = Calendar.current.dateComponents([.year], from: date, to: Date())
        
        return years
        
    }
    
    init(id: String,
                 avatar: String? = nil,
                 firstname: String? = nil,
                 lastname: String? = nil,
                 email: String? = nil,
                 birthdate: String? = nil,
                 nacionality: String? = nil,
                 country: String? = nil) {
    
    
    self.id = id
    self.avatar = avatar
    self.firstname = firstname
    self.lastname = lastname
    self.email = email
    self.birthdate = birthdate
    self.country = country
    self.nacionality = nacionality
    }
    
}
