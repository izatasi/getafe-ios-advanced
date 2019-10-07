//
//  UserDTO.swift
//  CursoIOS_Advanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import Foundation

struct UserDTO: Codable{
    let gender: String?
    let name: NameDTO?
    let location: LocationDTO?
//    let email: String?
    let login: LoginDTO?
    let dob: DobDTO?
    let registered: RegisteredDTO
    let phone: String?
    let cell: String?
    //let id: IdDTO?
    let picture: PictureDTO
    //let nat: String?

    private enum CodingKeys: String, CodingKey {
        case name = "firstname"
        case gender
        case location
        case login
        case dob
        case registered
        case phone
        case cell
        case picture
    }
}
