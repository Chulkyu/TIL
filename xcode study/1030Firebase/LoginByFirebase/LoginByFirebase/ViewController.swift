//
//  ViewController.swift
//  LoginByFirebase
//
//  Created by Maru on 30/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    
    @IBAction func sign(_ sender: Any) {
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

