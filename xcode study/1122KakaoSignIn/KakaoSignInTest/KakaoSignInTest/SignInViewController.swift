//
//  ViewController.swift
//  KakaoSignInTest
//
//  Created by Maru on 22/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

        
    @IBAction private func signInDidTap(_ sender: Any) {
        guard let session = KOSession.shared() else { return }
        
        // Close old session
        session.isOpen() ? session.close() : ()
        
        session.open(completionHandler:  { (error) in
            if !session.isOpen() {
                // 에러코드는 KOErrorCode 참고
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        print("Cancelled")
                    default:
                        print(error.localizedDescription)
                    }
                }
            } else {
                print("Login Success")
            }
//        })
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
    }
    
    /**********t*******************************************
        KOAuthType - 카카오계정 로그인시의 인증타입
        KOAuthTypeTalk -
        KOAuthType
 
    ******************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

