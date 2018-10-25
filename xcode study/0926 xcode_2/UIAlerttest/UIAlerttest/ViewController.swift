//
//  ViewController.swift
//  UIAlerttest
//
//  Created by Maru on 27/09/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonDidTap(_ sender: UIButton) {        let alertController = UIAlertController(
            title: "타이틀", message: "메세지", preferredStyle: .alert)
       
        let okAction = UIAlertAction(
        title: "OK", style: .default) { _ in print("OK")
            
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel", style: .cancel, handler: nil)
//        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        let voidAction = UIAlertAction(title: "Void", style: .default) { _ in print("Do Nothing")
            
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(voidAction)
        present(alertController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

