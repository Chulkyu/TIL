//
//  ViewController2.swift
//  frameAndbounds
//
//  Created by Maru on 27/09/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    let textview2 = UITextView()
        textview2.frame = CGRect(x: 15, y: 552, width: 345, height: 100)
        textview2.backgroundColor = .black
        view.addSubview(textview2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
