//
//  UserDetailCountry.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailCountry: UITableViewCell {

    static let cellIdentifier = String(describing: UserDetailCountry.self)

    @IBOutlet weak var viewUserDetailCountry: UIView!
    @IBOutlet weak var flagUserDetailCountry: UIImageView!
    @IBOutlet weak var label1UserDetailCountry: UILabel!
    @IBOutlet weak var label2UserDetailCountry: UILabel!
    @IBOutlet weak var label3UserDetailCountry: UILabel!

    override func prepareForReuse() {
        flagUserDetailCountry.image = nil
        label1UserDetailCountry.text = nil
        label2UserDetailCountry.text = nil
        label3UserDetailCountry.text = nil
    }
    
    func configureCell(flag: String?, country: String?, state: String?, city: String?) {

        let url = URL(string: flag ?? "")
        flagUserDetailCountry.kf.setImage(with: url)
        label1UserDetailCountry.text = country
        label2UserDetailCountry.text = state
        label3UserDetailCountry.text = city
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
