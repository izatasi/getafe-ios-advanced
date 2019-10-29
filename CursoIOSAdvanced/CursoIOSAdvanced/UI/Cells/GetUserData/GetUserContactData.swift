//
//  GetUserContactData.swift
//  CursoIOSAdvanced
//
//  Created by Paulo Galeano on 24/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.//

import UIKit

class GetUserContactData: UITableViewCell {
    static let cellIdentifier = String(describing: GetUserContactData.self)
    static let cellHeight = CGFloat(100)

    @IBOutlet weak var eMailField: UITextField!
    
    @IBOutlet weak var mobileField: UITextField!
    
    @IBOutlet weak var landlineField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
}
