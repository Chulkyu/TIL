//
//  UIFont.swift
//  LoginScreenTutorial
//
//  Created by Maru on 05/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

private struct Default {
    static let font = UIFont.systemFont(ofSize: 16)
}

extension UIFont {
    public class var Regular: UIFont {
        return UIFont(name: "PingFangTC-Regular", size: 16) ?? Default.font
    }
    
    public class var Semibold: UIFont {
        return UIFont(name: "PingFangTC-Regular", size: 16) ?? Default.font
    }
    
    public class var Title: UIFont {
        return UIFont(name: "PingFangTC-Regular", size: 22) ?? Default.font
    }
}
