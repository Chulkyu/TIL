//
//  ViewController.swift
//  frameAndbounds
//
//  Created by Maru on 27/09/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//    let textview = UITextView()
//        textview.frame = CGRect(x: 15, y: 15, width: 345, height: 100)
//        textview.backgroundColor = .black
//        view.addSubview(textview)
//
//    let textview2 = UITextView()
//        textview2.frame = CGRect(x: 15, y: 552, width: 345, height: 100)
//        textview2.backgroundColor = .black
//        view.addSubview(textview2)

    
    let textview3 = UITextView()
        textview3.frame = CGRect(x: 15, y: 15, width: view.frame.size.width - 30, height: 100)
        textview3.backgroundColor = .red
        view.addSubview(textview3)
        
//    let imageview = UIImageView()
//        imageview.frame = CGRect(x: 15, y: 15, width: view.frame.size.width - 30, height: view.frame.size.height - 30)
//        imageview.backgroundColor = .black
//        view.addSubview(imageview)
//
//    let imageview2 = UIImageView()
//        imageview2.frame = CGRect(x: 30, y: 30, width: view.frame.size.width - 60, height: view.frame.size.height - 60)
//        imageview2.backgroundColor = .yellow
//        view.addSubview(imageview2)
//
//    let imageview3 = UIImageView()
//        imageview3.frame = CGRect(x: 45, y: 45, width: view.frame.size.width - 90, height: view.frame.size.height - 90)
//        imageview3.backgroundColor = .green
//        view.addSubview(imageview3)
        
        let imageview = UIImageView()
        imageview.frame = CGRect(
            x: 15,
            y: 15,
            width: view.frame.size.width - 30,
            height: view.frame.size.height - 30
        )
        imageview.backgroundColor = .black
        view.addSubview(imageview)

        let imageview2 = UIImageView()
        imageview2.frame = CGRect(x: imageview.bounds.origin.x + 15, y: imageview.bounds.origin.y + 15, width: imageview.bounds.size.width - 30, height: imageview.bounds.size.height - 30)
        imageview2.backgroundColor = .yellow
        imageview.addSubview(imageview2)

        let imageview3 = UIImageView()
        imageview3.frame = CGRect(x: imageview2.bounds.origin.x + 15, y: imageview2.bounds.origin.y + 15, width: imageview2.bounds.size.width - 30, height: imageview2.bounds.size.height - 30)
        imageview3.backgroundColor = .green
        imageview2.addSubview(imageview3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

