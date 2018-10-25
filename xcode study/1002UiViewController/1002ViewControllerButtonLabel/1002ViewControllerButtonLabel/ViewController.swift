//
//  ViewController.swift
//  1002ViewControllerButtonLabel
//
//  Created by Maru on 02/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dataLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        // Do any additional setup after loading the view, typically from a nib.
    createButton()
    createButton2()
    createLabel2()
    }

    func createLabel2() {
        let labelFrame = CGRect(x: 100, y: 200, width: 100, height: 50)
        dataLabel.frame = labelFrame
        dataLabel.text = "first display"
        view.addSubview(dataLabel)
    }
    
    func createButton() {
        let buttonFrame = CGRect(x: 100, y: 100, width: 100, height: 50)
        let button = UIButton(type: .system)
        button.frame = buttonFrame
        button.setTitle("first", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    func createButton2() {
        let buttonFrame = CGRect(x: 100, y: 300, width: 100, height: 50)
        let button = UIButton(type: .system)
        button.frame = buttonFrame
        button.setTitle("second", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap2), for: .touchUpInside)
        
        view.addSubview(button)
    }


    @objc func buttonDidTap() {
        let second = SecondViewController()
        present(second, animated: true)
        second.countLabel.text = "first"
    }
    
    @objc func buttonDidTap2() {
        let second = SecondViewController()
        present(second, animated: true)
        second.countLabel.text = "second"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

