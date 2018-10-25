//
//  ViewController.swift
//  0928Calculator
//
//  Created by Maru on 28/09/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var Number1: UITextField!

    @IBOutlet weak var Operator: UITextField!
    
    @IBOutlet weak var Number2: UITextField!
    
    
    @IBAction func calculate(_ sender: UIButton) {

       var number1 = Number1.text
       var number2 = Number2.text
       var computing = Operator.text
 
        var result = 0
        
        if let value1 = Int(number1!), let value2 = Int(number2!) {
            print(value1, value2)
            
        switch computing {
        case "+":
            result = Int(number1!)! + Int(number2!)!
            print(result)
            
        case "-":
            result = Int(number1!)! - Int(number2!)!
            print(result)
            
        case "*":
            result = Int(number1!)! * Int(number2!)!
            print(result)
            
        case "/":
            result = Int(number1!)! / Int(number2!)!
            print(result)
            
        default:
            number1 = "you should Enter"
            computing = " +, -, *, / "
            number2 = "understand?"
            print("Enter the colleted value!")
            }
    
        
            let alert = UIAlertController(title: "Result", message: " \(number1!) \(computing!) \(number2!) = \(result)", preferredStyle: .alert)
      
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(cancel)
            present(alert, animated: true)
            
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Enter the right value", preferredStyle: .actionSheet)

            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(cancel)
            present(alert, animated: true)

        }
            
        
        
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

