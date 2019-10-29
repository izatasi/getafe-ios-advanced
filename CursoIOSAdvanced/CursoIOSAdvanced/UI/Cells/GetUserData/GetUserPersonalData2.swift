//
//  GetUserPersonalData2.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 25/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class GetUserPersonalData2: UITableViewCell {
    static let cellIdentifier = String(describing: GetUserPersonalData2.self)
    static let cellHeight = CGFloat(155)
    
    @IBOutlet weak var onPressGender: UISegmentedControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
