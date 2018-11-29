//
//  ViewController.swift
//  SnapKit Test
//
//  Created by Maru on 23/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let redView = UIView()
    let grayView = UIView()
    let greenView = UIView()
    let yellowView = UIView()
    
    
    let blueView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { (make) in
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(50)
        }
        
        
        view.addSubview(grayView)
        grayView.backgroundColor = .gray
        grayView.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width).dividedBy(2)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(100)
            make.leading.equalTo(view)
        }
        
        view.addSubview(greenView)
        greenView.backgroundColor = .green
        greenView.snp.makeConstraints { (make) in
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.top.equalTo(redView.snp.bottom)
            make.bottom.equalTo(grayView.snp.top)
        }
        
        greenView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { (make) in
            make.edges.equalTo(greenView).inset(30)

            
            
            
        }
    }


}

