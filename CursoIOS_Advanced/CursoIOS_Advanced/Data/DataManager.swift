//
//  DataManager.swift
//  CursoIOS_Advanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import Foundation

class DataManager {
    //MARK:  - Singleton declaration... una clase con único objeto!!!
    static let shared = DataManager()
    private init() {}
    
    func users(completion: ServiceCompletion) {
        let user = usersDB()
        if usersDB().count > 0 {
           // return usersDB()
            completion(.success(data: user))
            
        }
        else {
            //Llamar al servicio y guardar usuarios en BBDD
            usersForceUpdate(completion: completion)
        }
        
    }
    
    func usersForceUpdate(completion: ServiceCompletion) {
        //llamar al servicio y guardar usuarios en BBDD
        ApiManager.shared.fetchUsers() { result in
            switch result {
            case .success(let data):
                guard let users = data as? UsersDTO else {
                    completion(.failure(msg:"Error.. ver en guardlet UsersForceUpdate"))
                    return
                }
                
                //Eliminar todo los usuarios de la BD
                DatabaseManager.shared.deleteAll()
                //Guardar usuarios en la BD
                save(users: users)
                completion(.success(data:users))

            case .failure(let msg):
                print("fallo al obtener usuarios del sercicio: \(msg)")
                completion(.failure(msg:msg))
            }
            
        }
    }
        
        private func user(id:String) -> UserDAO? {
            return DatabaseManager.shared.user(by: id)
        }
        
        
        private func usersDB() -> Array<UserDAO> {
            return Array(DatabaseManager.shared.users())
            //        return Array()
        }
        
        private func save(users: UsersDTO) {
            guard let usersToSave = users.users else {
                return
            }
            
            usersToSave.forEach{ save(user:$0)}
        }
        
        
        private func save(user: UserDTO) {
            guard let userId = user.login?.uuid else {
                return
            }
            
            let userDB = UserDAO(uuid: userId,
                                 avatar: user.picture.large,
                                 firstname: user.name?.firstname,
                                 lastname: user.name?.lastname,
                                 gender:user.gender,
                                 latitude: user.location?.coordinates?.latitude,
                                 longitude: user.location?.coordinates?.longitud)
            
            DatabaseManager.shared.save(user:userDB)
            
            
        }
        
}
