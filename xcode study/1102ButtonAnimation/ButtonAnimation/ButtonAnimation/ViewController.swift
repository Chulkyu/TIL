//
//  ViewController.swift
//  ButtonAnimation
//
//  Created by Maru on 02/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        button1.center.y = button0.center.y
        button2.center.y = button0.center.y
        button3.center.y = button0.center.y
        button4.center.y = button0.center.y
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    @IBAction func button(_ sender: Any) {
        
        addAnimateKeyframes()
        
    }
    
    private func addAnimateKeyframes() {
        if self.button1.center.y == self.button0.center.y {
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                    self.button1.center.y = self.button0.center.y - 40
                })
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                    self.button2.center.y = self.button1.center.y - 40
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                    self.button3.center.y = self.button2.center.y - 40
                })
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                    self.button4.center.y = self.button3.center.y - 40
                })
            })
        } else {
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                    self.button1.center.y = self.button0.center.y
                })
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                    self.button2.center.y = self.button1.center.y
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                    self.button3.center.y = self.button2.center.y
                })
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                    self.button4.center.y = self.button3.center.y
                })
            })
        }
            
        
//            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, animations: {
//                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
//                    self.button1.center.y = self.button0.center.y
//                    self.button2.center.y = self.button1.center.y
//                    self.button3.center.y = self.button2.center.y
//                    self.button4.center.y = self.button3.center.y
//                })
//
//            })

    }
    
    
}

