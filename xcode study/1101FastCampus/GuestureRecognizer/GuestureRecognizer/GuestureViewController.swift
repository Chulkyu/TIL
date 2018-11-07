//
//  GuestureViewController.swift
//  GuestureRecognizer
//
//  Created by Maru on 01/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class GuestureViewController: UIViewController {
    
    var isQuadruple = false
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        
        
    }
    
    
    @IBAction func handleTapGuesture(_ sender: UITapGestureRecognizer) {
        if !isQuadruple {
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2) // 2배로 만들기
        } else {
            imageView.transform = CGAffineTransform.identity // 원래 형태로
        }
        isQuadruple = !isQuadruple
    }
    
    @IBAction func handleRotationGuesture(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        imageView.transform = imageView.transform.rotated(by: rotation)
        sender.rotation = 0 // 초기화 시켜주지 않으면 회전 시킬 때 마다 기존 rotation 값에 새 값이 계속 더해져서 회전이 엄청 빨리 됨.
        
    }
    
    // 왼쪽으로 swipe 하면 cat1 이미지를 띄우고
    // 오른쪽으로 swipe 하면 cat2 이미지를 띄우기
    @IBAction func handleSwipeGuesture(_ sender: UISwipeGestureRecognizer) {
        let swipe = sender.direction
        let guesturePoint = sender.location(in: view)
        
        print(swipe)
        
        if imageView.frame.contains(guesturePoint) {
            if swipe == .right {
                imageView.image = UIImage(named: "cat2")
            } else {
                imageView.image = UIImage(named: "cat1")
            }
            
        }
    }
    
}
