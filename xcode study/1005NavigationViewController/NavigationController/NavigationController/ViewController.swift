//
//  ViewController.swift
//  NavigationController
//
//  Created by Maru on 05/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnTap = false
        
        navigationItem.title = "Navigation Title"
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func buttonDidTap() {
        let secondVC = SecondViewController()
//        navigationController?.pushViewController(secondVC, animated: true)
       
        /* NavigationController -> push
          !NavigationController -> Present */
        
        show(secondVC, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

