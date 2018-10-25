//
//  ViewController.swift
//  1002practice2Retry
//
//  Created by Maru on 02/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var firstLabel: UILabel!
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) {
        guard let sourceVC = sender.source as? SecondViewController else { return }
        self.firstLabel.text = "\(Int(sourceVC.secondLabel.text!)! + 10)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

