//
//  FlagForNationality.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 28/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class FlagForNationality: UICollectionViewCell {

    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var flagLabel: UILabel!
    
    override func prepareForReuse() {
        flagLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
