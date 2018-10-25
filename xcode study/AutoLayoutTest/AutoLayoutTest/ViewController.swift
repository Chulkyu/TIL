//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by Maru on 15/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let firstView = UIView()
    private let secondView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.backgroundColor = .black
        
        secondView.backgroundColor = .yellow
        
        
//        view.addSubview(firstView)
//        firstView.addSubview(secondView)
        
//        activeLayoutAnchors()
        
        view.addSubview(firstView)
        view.addSubview(secondView)
        activeLayoutAnchor2()
    }
    
    func activeLayoutAnchors() {
        firstView.translatesAutoresizingMaskIntoConstraints = false
        
        firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        

        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 30).isActive = true
        secondView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -30).isActive = true
        secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 30).isActive = true
        secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -30).isActive = true
    }

    func activeLayoutAnchor2() {
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        
        firstView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 1).isActive = true
        
        firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        firstView.trailingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: -10).isActive = true
        
    
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        secondView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        secondView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 10).isActive = true
        secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        
        
        
    }

}

