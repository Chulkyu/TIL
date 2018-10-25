//
//  SecondViewController.swift
//  1002viewController
//
//  Created by Maru on 02/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let countLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n-------------- [ second viewDidLoad ] ----------- \n")
        // Do any additional setup after loading the view.
    view.backgroundColor = .orange
        createButton()
        createLabel()
    }
    
    
    func createLabel() {
        let labelFrame = CGRect(x: 100, y: 200, width: 100, height: 50)
        countLabel.frame = labelFrame
        countLabel.text = "0"
        view.addSubview(countLabel)
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
    
    @objc func buttonDidTap() {
//        let viewController = ViewController()
//        present(viewController, animated: true)
        dismiss(animated: true)
//        presentingViewController?.dismiss(annimated: true)
//        print(presentedViewController) // 내가 나타나게 한 놈, nil
//        print(presentingViewController) // ViewController, 나를 나타나게 한 놈
//        print(presentingViewController?.presentedViewController)
        // SecondViewController
            }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\n-------------- [ second viewWillAppear ] ----------- \n")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n-------------- [ second viewDidAppear ] ----------- \n")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\n------------ [ second viewWillDisappear ] --------- \n")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\n------------ [ second viewDidDisappear ] --------- \n")
    }

    @IBAction func unwindToSecondViewController(_ sender: UIStoryboardSegue) {
        
        // Use data from the view controller which initiated the unwind segue
    }
    deinit {
        print("\n----------- [ second deinit ] -------------\n")
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
