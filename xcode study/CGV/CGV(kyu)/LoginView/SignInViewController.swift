//
//  SignInViewController.swift
//  LoginView
//
//  Created by Maru on 22/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBAction func kakaoSignInButton(_ sender: Any) {
        guard let session = KOSession.shared() else { return }
        
        // close old session
        session.isOpen() ? session.close() : ()
        
        session.open(completionHandler:  { (error) in
//            guard session.isOpen() else {
//                // Open Session field
//                return
//            }
//             SignIn Success
            
            if !session.isOpen() {
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        print("Cancelled")
                    default:
                        print(error.localizedDescription)
                    }
                }
            } else {
                print("SignIn Success")
            }
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func unwindToSignInViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
}
