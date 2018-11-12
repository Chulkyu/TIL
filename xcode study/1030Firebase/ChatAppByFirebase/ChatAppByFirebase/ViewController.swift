//
//  ViewController.swift
//  ChatAppByFirebase
//
//  Created by Maru on 30/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import SnapKit    // Constraint를 간단히 하기 위한 Kit
import Firebase

class ViewController: UIViewController {

    
    var box = UIImageView()
    
    var remoteConfig: RemoteConfig!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //remoteConfig 초기화, import Firebase 필수
       remoteConfig = RemoteConfig.remoteConfig()
       remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: true)
        
        // 기본 디폴트값 설정은 local Plist에서 가져오는 코드
       remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")

        // firebase 서버에서 값 받아오는 코드
        remoteConfig.fetch(withExpirationDuration: TimeInterval(3)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activateFetched()
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            self.displayWelcome()
        }

        
        self.view.addSubview(box)
        box.snp.makeConstraints { ( make) in
            make.center.equalTo(self.view)
        }
        box.image = #imageLiteral(resourceName: "loadicon")
        
    }

    
    // 시작 화면에 alert 띄우기 (설정값 remoteConfig에서 가져오기)
    func displayWelcome() {
        let color = remoteConfig["splash_background"].stringValue
        let caps = remoteConfig["splash_message_caps"].boolValue
        let message = remoteConfig["splash_message"].stringValue
        
        if (caps) {
            let alert = UIAlertController(title: "공지사항", message: message, preferredStyle: UIAlertControllerStyle.alert)
            // 앱이 자동으로 꺼지게 하는 코드
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: { (action) in
                exit(0)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginVC, animated: false, completion: nil)
        }
        self.view.backgroundColor = UIColor(hex: color!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// 16진수 코드 컬러를 쓸 수 있도록
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        
        // 1을 넣어야 # 제외한 값을 읽을 수 있음
        scanner.scanLocation = 1
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
