//
//  ViewController.swift
//  Notification
//
//  Created by Maru on 23/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // addObserver 이후의 데이터만 받을 수 있다.
        NotificationCenter.default
            .addObserver(self, selector: #selector(didReceiveNotification(_:)), name: Notification.Name.UIKeyboardWillShow , object: nil)
        
    }

    @objc func didReceiveNotification(_ sender: Notification) {
        guard let userInfo = sender.userInfo,
            let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
        let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
        else { return }
        print(keyboardFrame)
        print(duration)
        print(curve)
        print(sender.userInfo)
    }

    @IBAction func didOnExit(_ sender: Any) {
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
