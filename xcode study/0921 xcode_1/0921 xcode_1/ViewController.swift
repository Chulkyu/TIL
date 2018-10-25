//
//  ViewController.swift
//  0921 xcode_1
//
//  Created by Maru on 21/09/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var innerView: UIView!
    
    @IBOutlet weak var goButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .black
    innerView.backgroundColor = .white
        goButton.backgroundColor = .cyan

    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goGoButton(_ sender: Any) {
        print("Go button")
        
        print(sender)
        goButton.setTitleColor(.white, for: .selected)
        goButton.isSelected = !goButton.isSelected
    }

}

