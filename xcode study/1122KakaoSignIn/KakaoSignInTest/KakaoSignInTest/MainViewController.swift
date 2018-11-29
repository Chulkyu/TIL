//
//  MainViewController.swift
//  KakaoSignInTest
//
//  Created by Maru on 22/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var prfileImage: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        KOSessionTask.userMeTask { [weak self] (error, userMe) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            guard let me = userMe,
                let nickname = me.nickname,
                let profileImageLink = me.profileImageURL,
            let thumbnailImageLink = me.thumbnailImageURL else { return }
            
            print(me)
            
            self?.nickNameLabel.text = nickname
            
            let imageLinks = [thumbnailImageLink, profileImageLink]
            for url in imageLinks {
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let error = error {
                        return print(error.localizedDescription)
                    
                    }
                    guard let data = data, let image = UIImage(data: data) else { return }
                    
                    DispatchQueue.main.async {
                        if url == thumbnailImageLink {
                            self?.thumbnailImage.image = image
                            
                        } else {
                            self?.prfileImage.image = image
                        }
                    }
                    
                }).resume()
            }
            
        }
        
    }
    
    @IBAction private func signOutDidTap(_ sender: Any) {
        KOSession.shared()?.logoutAndClose(completionHandler: { (success, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            // Logout success
        })
    }

}
