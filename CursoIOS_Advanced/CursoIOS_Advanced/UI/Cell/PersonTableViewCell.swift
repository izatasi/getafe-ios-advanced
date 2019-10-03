//
//  PersonTableViewCell.swift
//  CursoIOS_Advanced
//
//  Created by Paulo Galeano on 03/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: PersonTableViewCell.self)
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
    @IBOutlet weak var mLabelEmail: UILabel!
    
    
    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
        mLabelEmail.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
    }
    
    func configureCell(image: String?, name: String?, email: String?) {
        mImage.image = UIImage(named: image ?? "")
        mLabelName.text = name
        mLabelEmail.text = email
    }
}

