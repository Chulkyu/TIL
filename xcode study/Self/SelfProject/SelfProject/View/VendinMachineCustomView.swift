//
//  VendinMachineCustomView.swift
//  SelfProject
//
//  Created by Maru on 23/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class VendinMachineCustomView: UIView {
    
    private let xibName = "VendingMachineCustomView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        
    }
    
}
