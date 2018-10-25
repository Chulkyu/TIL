//
//  ViewController.swift
//  1002viewController
//
//  Created by Maru on 02/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       print("\n-------------- [ viewDidLoad ] ----------- \n")
        // Do any additional setup after loading the view, typically from a nib.
        
        createButton()
    }
    
    func createButton() {
        let buttonFrame = CGRect(x: 100, y: 100, width: 100, height: 50)
        let button = UIButton(type: .system)
        button.frame = buttonFrame
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    var count = 0
    
    @objc func buttonDidTap() {
        let secondViewController = SecondViewController()
        // property 생성, 메모리에 저장
        // viewDidLoad 미호출
//        let number = Int(secondViewController.countLabel.text ?? "0") ?? 0
//        secondViewController.countLabel.text = "\(number + 1)"
        
        
        present(secondViewController, animated: true)
        count += 1
        secondViewController.countLabel.text = String(count)
        // viewDidLoad -> viewWillAppear -> viewDidAppear
        // present 되는 순간 secondView 생성하고 viewDidLoad 불러옴
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\n-------------- [ viewWillAppear ] ----------- \n")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n-------------- [ viewDidAppear ] ----------- \n")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\n-------------- [ viewWillDisappear ] ----------- \n")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\n-------------- [ viewDidDisappear ] ----------- \n")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) {
        
        // Use data from the view controller which initiated the unwind segue
    }
        
    deinit {
        print("\n----------- [ first deinit ] -------------\n")

    }
}

