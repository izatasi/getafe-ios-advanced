//
//  UserDetail.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import UIKit

class UserDetail: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableUserDetail: UITableView!
    @IBOutlet weak var deleteButtonUserDetail: UIButton!
    
    @IBAction func deleteUser(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete  User?",
                                      message: "You will delete this User permanently.  Are you sure?",
                                      preferredStyle: .alert)
        
        // A qué el código para eliminar lo que sea...

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {[weak self] _ in

            //Incluir instrucción de eliminar aquí...
//            if let userDaoToDelete = DatabaseManager.shared.user(by: self?.userSelected?.id ?? "") {
//
//                DatabaseManager.shared.delete(user: userDaoToDelete)
//
//            }
            
            //Hasta aquí instrucciones de eliminación
               self?.navigationController?.popViewController(animated: true)}))

        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        
        present(alert, animated: true, completion: nil)

    }
    
    var userSelected: User?
        
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = userSelected?.name
        configureTableView()
    }
    
}


extension UserDetail: UITableViewDataSource, UITableViewDelegate {
    
    /// Configure tableView with default options
    func configureTableView() {
        tableUserDetail.register(UINib(nibName: UserDetailPersonalData.cellIdentifier, bundle: nil), forCellReuseIdentifier: UserDetailPersonalData.cellIdentifier)
  
        tableUserDetail.register(UINib(nibName: UserDetailMap.cellIdentifier, bundle: nil), forCellReuseIdentifier: UserDetailMap.cellIdentifier)

        tableUserDetail.register(UINib(nibName: UserDetailCountry.cellIdentifier, bundle: nil), forCellReuseIdentifier: UserDetailCountry.cellIdentifier)
        
        tableUserDetail.register(UINib(nibName: UserDetailContactData.cellIdentifier, bundle: nil), forCellReuseIdentifier: UserDetailContactData.cellIdentifier)

        tableUserDetail.dataSource = self
        tableUserDetail.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // Son 4 celdas para detalle de usuario
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return 300
        case 2:
            return 120
        case 3:
            return 120
        default:
            return 0
        }
        

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailPersonalData.cellIdentifier, for: indexPath) as? UserDetailPersonalData else {
                return UITableViewCell()
            }
            cell.configureCell(image: userSelected?.avatar, title: userSelected?.title, gender: userSelected?.gender, birthdate: userSelected?.birthdate)
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailMap.cellIdentifier, for: indexPath) as? UserDetailMap else {
                return UITableViewCell()
            }
            // Map
            cell.configureCell(latitude: userSelected?.latitude, longitude: userSelected?.longitude)
            return cell
            
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailCountry.cellIdentifier, for: indexPath) as? UserDetailCountry else {
                return UITableViewCell()
            }
            let countryCode = userSelected?.nationality ?? "AQ"
                cell.configureCell(flag: "https://www.countryflags.io/\(countryCode)/shiny/64.png", country: userSelected?.country, state: userSelected?.state, city: userSelected?.city)
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailContactData.cellIdentifier, for: indexPath) as? UserDetailContactData else {
                return UITableViewCell()
            }
            cell.configureCell(email: userSelected?.email, mobileNumber: userSelected?.mobile, phoneNumber: userSelected?.landline)
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
}

