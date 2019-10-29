//
//  GetUserPersonalData.swift
//  CursoIOSAdvanced
//
//  Created by Paulo Galeano on 24/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import UIKit

class GetUserPersonalData: UITableViewCell {
    static let cellIdentifier = String(describing: GetUserPersonalData.self)
    static let cellHeight = CGFloat(110)
    
    @IBOutlet weak var avatarImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageTap))
//        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
//    @objc func onImageTap(){
        
//    }
    
}
