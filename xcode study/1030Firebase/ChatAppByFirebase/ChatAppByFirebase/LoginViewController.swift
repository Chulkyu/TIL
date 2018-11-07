 //
 //  LoginViewController.swift
 //  ChatAppByFirebase
 //
 //  Created by Maru on 03/11/2018.
 //  Copyright © 2018 Maru. All rights reserved.
 //
 
 import UIKit
 import Firebase
 
 class LoginViewController: UIViewController {
    
    @IBOutlet weak var logIn: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    // color를 리모트에서 불러오기 위한 코드, import Firebase 필수
    let remoteConfig = RemoteConfig.remoteConfig()
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
        logIn.backgroundColor = UIColor(hex: color)
        signIn.backgroundColor = UIColor(hex: color)
        
        signIn.addTarget(self, action: #selector(presentSignUp), for: .touchUpInside)
    }
    
    @objc func presentSignUp() {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(view, animated: true, completion: nil)
        
        
    }
    
    
 }
