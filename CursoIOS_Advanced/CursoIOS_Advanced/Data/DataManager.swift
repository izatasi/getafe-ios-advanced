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
    
    func users(completion: @escaping ServiceCompletion) {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            if let usersDAO = self?.usersDB(), usersDAO.count > 0  {
                
                let users = self?.users(from: usersDAO)
                
                DispatchQueue.main.async {
                    completion(.success(data: users))
                }
            }
            else {
                //Llamar al servicio y guardar usuarios en BBDD
                DispatchQueue.main.async {
                    self?.usersForceUpdate(completion: completion)
                }
                
            }
            
        }
    }
    
    func usersForceUpdate(completion: @escaping ServiceCompletion) {
        //@escaping ServiceCompletion
        
        //        let queue = DispatchQueue(label: "Hilo en Background")
        //
        //        queue.async {
        
        DispatchQueue.global(qos: .background).async {
            //llamar al servicio y guardar usuarios en BBDD
            ApiManager.shared.fetchUsers() { [weak self] result in
                switch result {
                case .success(let data):
                    guard let users = data as? UsersDTO else {
                        completion(.failure(msg:"Error.. ver en guardlet UsersForceUpdate"))
                        return
                    }
                    
                    //Eliminar todo los usuarios de la BD
                    DatabaseManager.shared.deleteAll()
                    //Guardar usuarios en la BD
                    self?.save(users: users)
                    
                    DispatchQueue.main.async {
                        completion(.success(data:users))
                    }
                    
                case .failure(let msg):
                    print("fallo al obtener usuarios del sercicio: \(msg)")
                    DispatchQueue.main.async {
                        completion(.failure(msg:msg))
                    }
                }                
            }
        }
    }
    
    private func user(id:String, completion: @escaping ServiceCompletion) {
        DispatchQueue.global(qos: .background).async {
            if let userDAO = DatabaseManager.shared.user(by: id) {
                let user = User(id: userDAO.uuid, avatar: userDAO.avatar, firstname: userDAO.firstname, lastname: userDAO.lastname, email: userDAO.email, birthdate: userDAO.birthdate?.description, nacionality: nil, country: userDAO.country)
                
                DispatchQueue.main.async {
                    completion(.success(data:user))
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(.failure(msg:"Error al generar userss!!"))
                }

            }
        }
        
    }
    
    
    
    private func usersDB() -> Array<UserDAO> {
        return Array(DatabaseManager.shared.users())
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
                             //email: user.,
            gender: user.gender,
            //birthdate: user.,
            country: user.location?.country,
            latitude: user.location?.coordinates?.latitude,
            longitude: user.location?.coordinates?.longitud)
        
        DatabaseManager.shared.save(user:userDB)
        
        
    }
    
    private func user(from userDAO: UserDAO) -> User {
        
    }
    
    private func users(from usersDAO: Array<UserDAO>) -> Array<User> {
        
    }
}
