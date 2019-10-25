//
//  UsersViewController.swift
//  CursoIOSAdvanced
//
//  Created by David Jardon on 03/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit


class UsersViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentOptions: UISegmentedControl!
    
    @IBOutlet weak var marginFrame: UIView!
    
    // Value changed
    @IBAction func onListTypePressed(_ sender: UISegmentedControl) {
        // Save selected option
        DataManager.shared.save(optionSelected: sender.selectedSegmentIndex)
        // Update selected list type view
        updateListType(optionSelected: sender.selectedSegmentIndex)
    }
    
    // MARK: - Properties
    private var segueTarget = "SegueMainToDetail"
    private var cellSpacing: CGFloat = 16.0
    private var users: Array<User> = []
    
    private let refreshControlTableView = UIRefreshControl()
    private let refreshControlCollectionView = UIRefreshControl()

    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRefreshControl()
        
        configure(tableView: tableView)
        configure(collectionView: collectionView)
        
        loadOptionSelected()
        //loadUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //tableView.reloadData()
        //collectionView.reloadData()
        loadUsers()
    }

    
    private func configureRefreshControl() {
        // Configure Refresh Control
        refreshControlTableView.addTarget(self,
                                          action: #selector(refreshUsers),
                                          for: .valueChanged)
        refreshControlCollectionView.addTarget(self,
                                               action: #selector(refreshUsers),
                                               for: .valueChanged)
    }
    
    private func loadOptionSelected() {
        segmentOptions.selectedSegmentIndex = DataManager.shared.optionSelected
    }
    
    private func loadUsers() {
        DataManager.shared.users(forceUpdate: false) { [weak self] result in
            self?.parseUsers(result: result)
        }
    }
    
    @objc private func refreshUsers() {
        DataManager.shared.users(forceUpdate: true) { [weak self] result in
            self?.parseUsers(result: result)
        }
    }
    
    private func parseUsers(result: ServiceResult) {
        switch result {
            case .success(let data):
                guard let users = data as? Array<User> else {
                    return
                }
            
                self.users = users
                updateListType(optionSelected:
                segmentOptions.selectedSegmentIndex)
                
            case .failure(let msg):
                print(msg)
        }

        refreshControlTableView.endRefreshing()
        refreshControlCollectionView.endRefreshing()
    }
    
    private func updateListType(optionSelected: Int?) {
        switch optionSelected {
            case 0:
                tableView.isHidden = false
                collectionView.isHidden = true
                tableView.reloadData()
                
            default:
                tableView.isHidden = true
                collectionView.isHidden = false
                collectionView.reloadData()
        }
    }
}


// MARK: - Extension TableView methods
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        tableView.register(UINib(nibName: PersonTableViewCell.cellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: PersonTableViewCell.cellIdentifier)
        let tableDistance = (segmentOptions.frame.origin.y - tableView.frame.origin.y)
        tableView.contentInset = UIEdgeInsets(top: 2*tableDistance + segmentOptions.frame.height,
                                              left: 0,
                                              bottom: 0,
                                              right: 0)
        
        tableView.refreshControl = refreshControlTableView
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        
        if (indexPath.row < users.count) {
            let user = users[indexPath.row]
            cell.configureCell(image: user.avatar,
                               name: user.name,
                               subtitle: user.email,
                               birthdate: user.birthdate)
        }
        
        return cell
    }
    
    // Alistar la tabla...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Segundo paso: Perform Select
        performSegue(withIdentifier: segueTarget,
                     sender: indexPath)
    }

}


// MARK: - Extension CollectionView methods
extension UsersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    /// Configure collectionView with default options
    func configure(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: PersonCollectionViewCell.cellIdentifier,
                                      bundle: nil),
                                forCellWithReuseIdentifier: PersonCollectionViewCell.cellIdentifier)
        
        let tableDistance = (segmentOptions.frame.origin.y - tableView.frame.origin.y)
        collectionView.contentInset = UIEdgeInsets(top: tableDistance + segmentOptions.frame.size.height + tableDistance,
                                                   left: 0,
                                                   bottom: 0,
                                                   right: 0)
        //segmentOptions.frame.origin.y for top
        collectionView.refreshControl = refreshControlCollectionView
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonCollectionViewCell else {
            return UICollectionViewCell()
        }

        if (indexPath.row < users.count) {
            let user = users[indexPath.row]
            cell.configureCell(image: user.avatar,
                               title: user.name)
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - cellSpacing) / 2
        return CGSize(width: size,
                      height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueTarget, sender: indexPath)
    }
}

// MARK: - Aquí el prepare del TableView...

extension UsersViewController {
    
// Tercer paso: Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? UserDetail,
              let indexPath = sender as? IndexPath else {
                debugPrint("----Salida por el prepare en asignación del Segue----")
            return
        }

        destination.userSelected = users[indexPath.row]
        
    }
}


