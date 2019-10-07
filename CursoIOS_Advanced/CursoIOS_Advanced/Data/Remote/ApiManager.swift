//
//  ApiManager.swift
//  CursoIOS_Advanced
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import Foundation

enum ServiceResult {
    case success(data: Any?)  //Puede recibir cualquier objeto de cualquier tipo!!
    case failure(msg:String)
}

typealias ServiceCompletion = (_ completion: ServiceResult) -> ()

class ApiManager {
    
    // Singleton
    static let shared = ApiManager()
    private init() {}
    
    private let numUsers: Int = 100
    
    
    func fetchUsers(completion: ServiceCompletion) {
        
        completion(.success(data: "Bieeeeeennn"))
        
    }
    
    
    
    
}
