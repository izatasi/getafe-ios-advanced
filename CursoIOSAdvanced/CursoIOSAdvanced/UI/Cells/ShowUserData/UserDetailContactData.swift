//
//  UserDetailContactData.swift
//  CursoIOSAdvanced
//
//  Created by Paulo Galeano on 16/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import UIKit

class UserDetailContactData: UITableViewCell {

    static let cellIdentifier = String(describing: UserDetailContactData.self)

    @IBOutlet weak var viewContactData: UIView!
//    @IBOutlet weak var image1ContactData: UIImageView!
//    @IBOutlet weak var image2ContactData: UIImageView!
//    @IBOutlet weak var image3ContactData: UIImageView!
    @IBOutlet weak var label1ContactData: UILabel!
    @IBOutlet weak var label2ContactData: UILabel!
    @IBOutlet weak var label3ContactData: UILabel!
    
    override func prepareForReuse() {
//        image1ContactData.image = nil
//        image2ContactData.image = nil
//        image3ContactData.image = nil
        label1ContactData.text = nil
        label2ContactData.text = nil
        label3ContactData.text = nil
    }

    func configureCell(email: String?, mobileNumber: String?, phoneNumber: String?) {
//        image1ContactData.image = UIImage(named: imageEmail ?? "")
//        image2ContactData.image = UIImage(named: imageMobile ?? "")
//        image3ContactData.image = UIImage(named: imagePhone ?? "")
        label1ContactData.text = email
        label2ContactData.text = mobileNumber
        label3ContactData.text = phoneNumber
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    
}
