//
//  ViewController.swift
//  1002practice2
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
        
//        let destinationViewController = sender.destination
//        let sourceViewController = sender.source
        
                // Use data from the view controller which initiated the unwind segue
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
//        guard let destination = segue.destination as? SecondViewController else { return }
        
        // error
//        destination.secondLabel.text = "\(Int(firstLabel.text!)! + 1)"
        
        // ok
//        destination.data = Int(firstLabel.text!)! + 1
        // segue.destination // second
    }
    
    
    // 조건을 줘서 화면이 더 이상 넘어가지 말지 정해주는 것
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
//
//
//        return Int(firstLabel.text!)! < 50 ? true : false
//        
//    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

