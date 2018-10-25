//
//  ViewController.swift
//  MakeColor_Notification
//
//  Created by Maru on 23/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    @IBOutlet weak var red: UISlider!
    
    @IBOutlet weak var blue: UISlider!
    
    @IBOutlet weak var green: UISlider!
    
    @IBAction func adjust(_ sender: Any) {
        
        let color = ["red" : red.value, "blue" : blue.value, "green" : green.value]
        
        NotificationCenter.default.post(name: .sendNotification, object: self, userInfo: color)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
    }

    

}

