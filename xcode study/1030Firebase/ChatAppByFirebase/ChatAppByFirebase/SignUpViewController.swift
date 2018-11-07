//
//  SignUpViewController.swift
//  ChatAppByFirebase
//
//  Created by Maru on 04/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var cancel: UIButton!
    
    
    var remoteConfig = RemoteConfig.remoteConfig()
    var color: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBar = UIView()
        self.view.addSubview(statusBar)
        statusBar.snp.makeConstraints { (m) in
            m.right.left.top.equalTo(self.view)
            m.height.equalTo(20)
        }
        color = remoteConfig["splash_background"].stringValue
        statusBar.backgroundColor = UIColor(hex: color)
        signUp.backgroundColor = UIColor(hex: color)
        cancel.backgroundColor = UIColor(hex: color)
        
        signUp.addTarget(self, action: #selector(signUpEvent), for: .touchUpInside )
        
        cancel.addTarget(self, action: #selector(cancelEvent), for: .touchUpInside)
    }
    
    
    @objc func signUpEvent() {
        guard let email = email.text else { return }
        guard let password = password.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil && user != nil {
                print("User Creat")
            } else {
                print("Error creating user: \(error!.localizedDescription)")
            }
        }
    }
    
    @objc func cancelEvent() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
