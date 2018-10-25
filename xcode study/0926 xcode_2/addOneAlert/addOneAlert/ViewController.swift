//
//  ViewController.swift
//  addOneAlert
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

    @IBOutlet weak var display: UILabel!
    
    var number = 0
    
    @IBAction func plusOne(_ sender: UIButton) {
        
        let plusOneAlert = UIAlertController(
            title: "Plus One",
            message: "+1",
            preferredStyle: .alert)
        
        
       
        let plusOne = UIAlertAction(title: "PlusOne", style: .default) { _ in
            self.number += 1
            self.display.text = "\(self.number)"
            print("plus 1, \(self.number)")
        }
        
        let reset = UIAlertAction(
        title: "Reset", style: .destructive) { _ in
            self.number = 0
            self.display.text = "\(self.number)"
            print("Reset, \(self.number)")
        }
        
        let cancel = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
       
        let inputNumber = UIAlertAction(title: "Enter the Number", style: .default) { (alertAction) in
        let textField = plusOneAlert.textFields![0] as UITextField
        }
        
        plusOneAlert.addTextField { (textField) in
            textField.placeholder = "Enter the Number"
            
        }
        
//        let addAsTyping = UIAlertAction(title: "Typing Number", style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
        
        plusOneAlert.addAction(plusOne)
        plusOneAlert.addAction(reset)
        plusOneAlert.addAction(cancel)
        plusOneAlert.addAction(inputNumber)
        present(plusOneAlert, animated: true)
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

