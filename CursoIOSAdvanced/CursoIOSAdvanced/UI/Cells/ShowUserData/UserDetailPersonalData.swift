//
//  UserDetailPersonalData.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailPersonalData: UITableViewCell {
    static let cellIdentifier = String(describing: UserDetailPersonalData.self)

    @IBOutlet weak var viewPersonalData: UIView!
    @IBOutlet weak var imagePersonalData: UIImageView!
    @IBOutlet weak var label1PersonalData: UILabel!
    @IBOutlet weak var label2PersonalData: UILabel!
    @IBOutlet weak var label3PersonalData: UILabel!
    
    let NONAME = "No name"
    
    override func prepareForReuse() {
        imagePersonalData.image = nil
        label1PersonalData.text = nil
        label2PersonalData.text = nil
        label3PersonalData.text = nil
    }

    func configureCell(image: String?, title: String?, gender: String?, birthdate: Date?) {
        
//        debugPrint("Imagen portada: \(String(describing: image))")
        let url = URL(string: image ?? "")
//        debugPrint("URL portada: \(String(describing: url))")
        imagePersonalData.kf.setImage(with: url)

        label1PersonalData.text = title
        label2PersonalData.text = gender
        
        if let birthdateValue = birthdate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            label3PersonalData.text = dateFormatter.string(from: birthdateValue)
        }

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
