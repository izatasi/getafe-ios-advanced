//
//  ApiManager.swift
//  CursoIOSAdvanced
//
//  Created by David Jardon on 07/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceResult {
    case success(data: Any?)
    case failure(msg: String)
}

typealias ServiceCompletion = (_ results: ServiceResult) -> ()


class ApiManager {
    // MARK: - Singleton declaration
    static let shared = ApiManager()
    private init() {}
    
    private let numUsers: Int = 1_000
    private let serviceAddress = "https://randomuser.me/api/?results="
    
    private var testLoadUsersJson: UsersDTO? {
        if let path = Bundle.main.path(forResource: "users", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                return try decoder.decode(UsersDTO.self, from: jsonData)
            }
            catch let error {
                print("parse error: \(error.localizedDescription)")
                return nil
            }
        }
        else {
            print("Invalid filename/path.")
            return nil
        }
    }
    
    func fetchUsers(completion: @escaping ServiceCompletion) {
        // Llamar al servicio

        // Alamofire

        Alamofire.request("\(serviceAddress)\(numUsers)").response { [weak self] response in
            //Aquí ya podremos trabajar con los datos de la respuesta
            guard let jsonData = response.data else {
                completion(.failure(msg: "Error:  No llegan datos desde el URL \(String(describing: self?.serviceAddress))"))
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)

            if var users: UsersDTO? = try? decoder.decode(UsersDTO.self, from: jsonData) {
                debugPrint(users?.users?.count as Any)
                
                users?.users?.sort(by: { (userDTO1, userDTO2) -> Bool in
                    if let ageUserDTO1 = userDTO1.dob?.age, let ageUserDTO2 = userDTO2.dob?.age {
                    
                        return ageUserDTO1 < ageUserDTO2
                        
                    }
                    else {
                        return false
                    }
                    
                })
//                users?.users?.forEach({ (useri) in
//                    debugPrint(\(useri.dob?.age))
//                })
                completion(.success(data: users))
            }
            else {
                completion(.failure(msg: "Error:  No se generan los usuarios DTO"))

            }
            // Devolver datos
        }
    }
}
