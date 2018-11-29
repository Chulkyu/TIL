//
//  MainTableViewCell.swift
//  LoginView
//
//  Created by Maru on 13/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

 
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MainTableViewCell {
    func setCollectionViewDataSourceDelegate
        < D: UICollectionViewDelegate & UICollectionViewDataSource >
        (_ dataSourceDelegate: D, forRow row: Int)
    {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.reloadData()
    }
}
