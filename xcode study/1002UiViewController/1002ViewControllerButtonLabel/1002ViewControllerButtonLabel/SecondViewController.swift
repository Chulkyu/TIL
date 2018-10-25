//
//  SecondViewController.swift
//  1002ViewControllerButtonLabel
//
//  Created by Maru on 02/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let countLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        createLabel()
        createButton3()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var display: UILabel!
    
    func createLabel() {
        let labelFrame = CGRect(x: 100, y: 200, width: 100, height: 50)
        countLabel.frame = labelFrame
        countLabel.text = "second display"
        view.addSubview(countLabel)
    }
    
    func createButton3() {
        let buttonFrame = CGRect(x: 100, y: 100, width: 100, height: 50)
        let button = UIButton(type: .system)
        button.frame = buttonFrame
        button.setTitle("third", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap3), for: .touchUpInside)
        
        view.addSubview(button)
    }

    @objc func buttonDidTap3() {
        guard let first = presentingViewController as? ViewController else {return}
        
        dismiss(animated: true)
        first.dataLabel.text = "third"
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
