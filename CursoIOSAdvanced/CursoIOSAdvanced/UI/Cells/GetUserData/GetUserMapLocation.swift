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
    static let cellHeight = CGFloat(215)

    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var mapViewForLocation: MKMapView!
    
    override func prepareForReuse() {
        latitudeField.delegate = nil
        longitudeField.delegate = nil
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        latitudeField.delegate = self
//        longitudeField.delegate = self
    }
    
}
