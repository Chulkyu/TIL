//
//  BaseTextField.swift
//  LoginScreenTutorial
//
//  Created by Maru on 06/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    init(placeHolder: String? = nil) {
        super.init(frame: CGRect.zero)
        
        font = UIFont.Regular
        returnKeyType = .next
        
        attributedPlaceholder = NSAttributedString(string: placeHolder ?? "", attributes: [NSAttributedString.Key.font: UIFont.Regular, NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        
        autocorrectionType = .no
        autocapitalizationType = .none
        enablesReturnKeyAutomatically = true
        
        tintColor = .white
        textColor = .white
        
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: 45)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
}
