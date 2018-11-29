//
//  ViewController.swift
//  LoginView
//
//  Created by Maru on 12/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: TableView Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        return cell
    }
    
    
    // MARK: CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsideCollectionViewCell", for: indexPath) as! InsideCollectionViewCell
        return cell
    }

    
    
    // kakao logout
    @IBAction private func signOutDidTap(_ sender: Any) {
        KOSession.shared()?.logoutAndClose(completionHandler: { (success, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            // Logout success
        })
    }

    
}

