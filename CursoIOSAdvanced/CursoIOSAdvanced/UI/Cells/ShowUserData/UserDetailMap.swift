//
//  UserDetailMap.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import MapKit

class UserDetailMap: UITableViewCell {
    
@IBOutlet weak var userMapAddress: MKMapView!
    
    override func prepareForReuse() {
        //userMapAddress.region =

    }
    
    func configureCell(latitude: String?, longitude: String?) {
        //userMapAddress
        
        // set initial location
        let latitudeDouble = Double(latitude!)
        let longitudeDouble = Double(longitude!)
        let initialLocation = CLLocation(latitude: latitudeDouble!, longitude: longitudeDouble!)
        
        let regionRadius: CLLocationDistance = 300000
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        
        userMapAddress.mapType = .satellite
        userMapAddress.setRegion(coordinateRegion, animated: true)
    }

    
static let cellIdentifier = String(describing: UserDetailMap.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
