//
//  BaseButton.swift
//  LoginScreenTutorial
//
//  Created by Maru on 06/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    init(title: String?="", titleColor: UIColor, backgroundColor: UIColor, font: UIFont) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
