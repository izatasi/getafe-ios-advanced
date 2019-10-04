//
//  LocationDTO.swift
//  CursoIOS_Advanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import Foundation

struct LocationDTO: Codable {
    let street: String?
    let city: String?
    let state: String?
    let country: String?
    let postcode: Int?
    let coordinates: CoordinatesDTO?
    let timezone: TimeZoneDTO?
}
