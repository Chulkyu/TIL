//
//  SecondViewController.swift
//  MakeColor_Notification
//
//  Created by Maru on 23/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let sendNotification = Notification.Name("Create_Color")
}
class SecondViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification(_:)), name: Notification.Name.sendNotification, object: nil)
        
        
            
        }

    @objc func didReceiveNotification(_ sender: Notification) {
        guard let seletedColor = sender.userInfo as? Dictionary<String, Float> else { return }
        let r = CGFloat(seletedColor["red"]!)
        let g = CGFloat(seletedColor["green"]!)
        let b = CGFloat(seletedColor["blue"]!)
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        
    }

    
    

    

}
