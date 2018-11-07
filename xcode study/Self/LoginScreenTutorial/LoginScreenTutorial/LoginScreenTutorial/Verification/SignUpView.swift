//
//  SignUpView.swift
//  LoginScreenTutorial
//
//  Created by Maru on 07/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import Firebase

class SignUpView: UIView {
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "profile_placeholder")
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private let profileDescLabel: BaseLabel = {
        let lbl = BaseLabel(text: "Choose a profile picture", font: .Regular, textAlignment: .center, textColor: .lightGray, numberOfLines: 1)
        return lbl
    }()
    
     let nameTextField: BaseTextField = {
        let tf = BaseTextField(placeHolder: "Name")
        tf.backgroundColor = .clear
        tf.alpha = 0
        return tf
    }()
    
     lazy var sendButton: BaseButton = {
        let btn = BaseButton(title: "Send", titleColor: .white, backgroundColor: .Highlight, font: .Regular)
        btn.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        btn.alpha = 0
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .Accent
        
        add(subview: profileImageView) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.topAnchor, constant: 30),
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.heightAnchor.constraint(equalTo: p.widthAnchor, multiplier: 0.25),
            v.widthAnchor.constraint(equalTo: p.widthAnchor, multiplier: 0.25)
            
            ]}
        
        add(subview: profileDescLabel) { (v, p) in [
            v.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5),
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            ]}

        add(subview: sendButton) { (v, p) in [
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor, constant: -20),
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.heightAnchor.constraint(equalToConstant: 55),
            v.widthAnchor.constraint(equalTo: p.widthAnchor, multiplier: 0.6)
            
            ]}

        add(subview: nameTextField) { (v, p) in [
            v.bottomAnchor.constraint(equalTo: sendButton.topAnchor, constant: -25),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 40),
            v.heightAnchor.constraint(equalToConstant: 45),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -40)
            
            ]}

        nameTextField.addSeparatorLine(color: .lightGray)
    }
    
    @objc private func sendButtonTapped() {
        guard let name = nameTextField.text else { return }
        
//        Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>, completion: <#T##AuthDataResultCallback?##AuthDataResultCallback?##(AuthDataResult?, Error?) -> Void#>)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
