//
//  GetUserCountry.swift
//  CursoIOSAdvanced
//
//  Created by Paulo Galeano on 24/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.//

import UIKit

class GetUserCountry: UITableViewCell {
    static let cellIdentifier = String(describing: GetUserCountry.self)
    static let cellHeight = CGFloat(92)

    @IBOutlet weak var countrySelector: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
