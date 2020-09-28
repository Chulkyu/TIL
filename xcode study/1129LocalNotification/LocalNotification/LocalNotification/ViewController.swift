//
//  ViewController.swift
//  LocalNotification
//
//  Created by Maru on 29/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let notiManager = UNNotificationManager()
    
    
    @IBAction func triggerTimeIntervalNotofocation(_ sender: Any) {
        notiManager.triggerTimeIntervalNotification()
    }
    
    @IBAction func triggerCalenderNotofocation(_ sender: Any) {
        notiManager.triggerCalendarNotification()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

