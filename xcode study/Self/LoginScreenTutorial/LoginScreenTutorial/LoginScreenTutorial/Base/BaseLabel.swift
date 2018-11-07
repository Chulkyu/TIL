//
//  BaseLabel.swift
//  LoginScreenTutorial
//
//  Created by Maru on 06/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {
    
    init(text: String?="", font: UIFont, textAlignment: NSTextAlignment, textColor: UIColor, numberOfLines: Int, breakMode: NSLineBreakMode? = nil) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.isUserInteractionEnabled = false
        if let breakMode = breakMode { self.lineBreakMode = breakMode }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
