//
//  GetNewUser.swift
//  CursoIOSAdvanced
//
//  Created by Paulo Galeano on 25/10/2019.
//  Copyright © 2019 Paulo Galeano. All rights reserved.
//

import Foundation
import UIKit

class GetNewUser: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableForGettingNewUser: UITableView!
    @IBOutlet weak var discardNewUser: UIButton!
    @IBOutlet weak var saveNewUser: UIButton!
    
    private enum NewUserCellType: Int {
        case personalData = 0
        case personalData2
        case contactData
        case birthdate
        case country
        case address
        case mapLocation
        case nationality
    }
    
    //var user: UserDetail? = nil
    
    private let cellTypes = [NewUserCellType.personalData,
                             NewUserCellType.personalData2,
                             NewUserCellType.contactData,
                             NewUserCellType.birthdate,
                             NewUserCellType.country,
                             NewUserCellType.address,
                             NewUserCellType.mapLocation,
                             NewUserCellType.nationality]
        
    @IBAction func discardNewUser(_ sender: UIButton) {
        let alert = UIAlertController(title: "Discard new user?",
                                      message: "You will discard permanently this new user's data.  Are you sure?",
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
    
    @IBAction func saveNewUser(_ sender: UIButton) {
        
    }

    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add a new user"
        configureTableView()

    }
    
}

extension GetNewUser: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count // El número de tipos de celda
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch cellTypes[indexPath.row]{
        case .personalData:
            return GetUserPersonalData.cellHeight
        case .personalData2:
            return GetUserPersonalData2.cellHeight
        case .contactData:
            return GetUserContactData.cellHeight
        case .birthdate:
            return GetUserBirthdate.cellHeight
        case .country:
            return GetUserCountry.cellHeight
        case .address:
            return GetUserAddress.cellHeight
        case .mapLocation:
            return GetUserMapLocation.cellHeight
        case .nationality:
            return GetUserNationality.cellHeight
        }
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            switch cellTypes[indexPath.row] {
    
            case .personalData:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GetUserPersonalData.cellIdentifier, for: indexPath) as? GetUserPersonalData else {
                    return UITableViewCell()
                }
                return cell
                
            case .personalData2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GetUserPersonalData2.cellIdentifier, for: indexPath) as? GetUserPersonalData2 else {
                    return UITableViewCell()
                }
                return cell
                
            case .contactData:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GetUserContactData.cellIdentifier, for: indexPath) as? GetUserContactData else {
                    return UITableViewCell()
                }
                return cell

            case .birthdate:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GetUserBirthdate.cellIdentifier, for: indexPath) as? GetUserBirthdate else {
                    return UITableViewCell()
                }
                return cell
                
            case .country:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GetUserCountry.cellIdentifier, for: indexPath) as? GetUserCountry else {
                    return UITableViewCell()
                }
                return cell

            case .address:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GetUserAddress.cellIdentifier, for: indexPath) as? GetUserAddress else {
                    return UITableViewCell()
                }
                return cell

            case .mapLocation:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GetUserMapLocation.cellIdentifier, for: indexPath) as? GetUserMapLocation else {
                    return UITableViewCell()
                }
                return cell
                
            case .nationality:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GetUserNationality.cellIdentifier, for: indexPath) as? GetUserNationality else {
                    return UITableViewCell()
                }
                return cell

            }
    
           //return cell
        }
    
    
    /// Configure tableView with default options
    func configureTableView() {
        tableForGettingNewUser.register(UINib(nibName: GetUserPersonalData.cellIdentifier, bundle: nil), forCellReuseIdentifier: GetUserPersonalData.cellIdentifier)
        
        tableForGettingNewUser.register(UINib(nibName: GetUserPersonalData2.cellIdentifier, bundle: nil), forCellReuseIdentifier: GetUserPersonalData2.cellIdentifier)
        
        tableForGettingNewUser.register(UINib(nibName: GetUserContactData.cellIdentifier, bundle: nil), forCellReuseIdentifier: GetUserContactData.cellIdentifier)
        
        tableForGettingNewUser.register(UINib(nibName: GetUserBirthdate.cellIdentifier, bundle: nil), forCellReuseIdentifier: GetUserBirthdate.cellIdentifier)
        
        tableForGettingNewUser.register(UINib(nibName: GetUserCountry.cellIdentifier, bundle: nil), forCellReuseIdentifier: GetUserCountry.cellIdentifier)
        
        tableForGettingNewUser.register(UINib(nibName: GetUserAddress.cellIdentifier, bundle: nil), forCellReuseIdentifier: GetUserAddress.cellIdentifier)
        
        tableForGettingNewUser.register(UINib(nibName: GetUserMapLocation.cellIdentifier, bundle: nil), forCellReuseIdentifier: GetUserMapLocation.cellIdentifier)
        
        tableForGettingNewUser.register(UINib(nibName: GetUserNationality.cellIdentifier, bundle: nil), forCellReuseIdentifier: GetUserNationality.cellIdentifier)
        
        tableForGettingNewUser.dataSource = self
        tableForGettingNewUser.delegate = self
    }
}
  

  
