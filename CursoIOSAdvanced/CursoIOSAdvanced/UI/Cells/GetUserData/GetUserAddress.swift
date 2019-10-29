//
//  GetUserAddress.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 25/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class GetUserAddress: UITableViewCell {
    static let cellIdentifier = String(describing: GetUserAddress.self)
    static let cellHeight = CGFloat(100)

    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var StreetField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
