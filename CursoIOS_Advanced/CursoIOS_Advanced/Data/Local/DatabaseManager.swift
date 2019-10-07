//
//  DatabaseManager.swift
//  CursoIOS_Advanced
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    
    // Singleton
    static let shared = DatabaseManager()
    private init() {}
    
    private let realm = try! Realm()
    
    
    func save(user: UserDAO) {
        try! realm.write {
            realm.add(user, update: .modified)
        }
    }
    
    // Para traer los datos 
    func users() -> Results<UserDAO> {
        return realm.objects(UserDAO.self)
    }
    
    func user(by id: String) -> UserDAO? {
        
        //var userFiltered = realm.objects(UserDAO.self).filter(id)
        //let stringToSearch = "uuid ==" + id
        //return realm.objects(UserDAO.self).filter(stringToSearch)
        return realm.object(ofType: UserDAO.self,
                            forPrimaryKey: id)
    }
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func delete(user: UserDAO) {
        //var userObject =  self.user(id)
        try! realm.write {
            realm.delete(user)
        }
    }
}
