//
//  CastTableViewCell.swift
//  LoginView
//
//  Created by Maru on 30/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    var castPhoto: [String] = ["Bryan Singer", "Rami Malek", "Lucy Boynton", "Gwilym Lee"]
    
    @IBOutlet weak var castCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        castCollectionView.dataSource = self
        castCollectionView.delegate = self
        castCollectionView.register(UINib(nibName: "CastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CastCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CastTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCollectionViewCell", for: indexPath) as! CastCollectionViewCell
        cell.castImageView.image = UIImage(named: castPhoto[indexPath.row])
        
        return cell
    }
    
    
}
