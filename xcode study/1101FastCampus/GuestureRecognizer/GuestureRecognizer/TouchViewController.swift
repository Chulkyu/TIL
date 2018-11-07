//
//  TouchViewController.swift
//  GuestureRecognizer
//
//  Created by Maru on 01/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class TouchViewController: UIViewController {

    var isHoldingImage = false
    var lastTouchPoint = CGPoint.zero
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true // 자기 영역 벗어났을 때 잘라버리는거
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touch Began")
        
        // touch 는 어레이. 여러 손가락으로 터치 할 수도 있기 때문에 첫번째 터치로 지정.
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
        
        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named: "cat2")
            isHoldingImage = true
            lastTouchPoint = touchPoint
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touch Moved")
        
        guard isHoldingImage, let touch = touches.first else { return }
        let touchMove = touch.location(in: touch.view)
        
      //  if imageView.frame.contains(touchMove) // 밖에서 터치해서 드래그 포인트가 image를 지나는 순간 같이 움직이게 됨
        imageView.center.x = imageView.center.x + (touchMove.x - lastTouchPoint.x)
        imageView.center.y = imageView.center.y + (touchMove.y - lastTouchPoint.y)
        lastTouchPoint = touchMove
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touch Ended")
        imageView.image = UIImage(named: "cat1")
        isHoldingImage = false
        
    }
    
    
    // 터치 중에 전화가 오거나 알림창을 뛰우거나 어떤 식으로던 방해 받았을 때
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touch Cancelled")
        
        guard isHoldingImage else { return }
        isHoldingImage = false
        imageView.image = UIImage(named: "cat1")
    }
}
