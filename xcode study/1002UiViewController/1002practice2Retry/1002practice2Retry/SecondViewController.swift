//
//  SecondViewController.swift
//  1002practice2Retry
//
//  Created by Maru on 02/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var data = 0
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondLabel.text = "\(data)"
        // Do any additional setup after loading the view.
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