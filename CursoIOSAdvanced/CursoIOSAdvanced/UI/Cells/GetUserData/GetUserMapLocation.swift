//
//  GetUserMapLocation.swift
//  CursoIOSAdvanced
//
//  Created by Paulo Galeano on 24/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.//

import UIKit
import MapKit

class GetUserMapLocation: UITableViewCell {
    static let cellIdentifier = String(describing: GetUserMapLocation.self)

    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var mapViewForLocation: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
