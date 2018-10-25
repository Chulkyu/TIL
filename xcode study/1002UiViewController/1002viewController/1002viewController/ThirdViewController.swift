//
//  ThirdViewController.swift
//  1002viewController
//
//  Created by Maru on 02/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n-------------- [ third viewDidLoad ] ----------- \n")
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\n-------------- [ third viewWillAppear ] ----------- \n")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n-------------- [ third viewDidAppear ] ----------- \n")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\n-------------- [ third viewWillDisappear ] ----------- \n")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\n-------------- [ third viewDidDisappear ] ----------- \n")
    }
    
    
    deinit {
        print("\n----------- [ third deinit ] -------------\n")
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
