//
//  ViewController.swift
//  LoginScreenTutorial
//
//  Created by Maru on 05/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let logoimageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "logo")
        return iv
    }()
    
    private let emailImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "mail")
        return iv
    }()
    
    private let emailVertificationImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "checkmark")
        iv.alpha = 0
        return iv
    }()
    
    private let passwordVertificationImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "checkmark")
        iv.alpha = 0
        return iv
    }()


    
    private let passwordImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "lock")
        return iv 
    }()
    
     private lazy var emailTextField: BaseTextField = {
        let tf = BaseTextField(placeHolder: "Email")
        tf.backgroundColor = .clear
        tf.delegate = self
        return tf
    }()
    
     private lazy var passwordTextField: BaseTextField = {
        let tf = BaseTextField(placeHolder: "Password")
        tf.backgroundColor = .clear
        tf.delegate = self
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var vertificationButton: BaseButton = {
        let btn = BaseButton(title: "Sign In", titleColor: .white, backgroundColor: .Accent, font: .Regular)
        btn.addTarget(self, action: #selector(vertificationButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var forgotPWLabel: BaseLabel = {
        let lbl = BaseLabel(text: "Forgot your Password?", font: .Regular, textAlignment: .center, textColor: .white, numberOfLines: 1)
        return lbl
    }()
    
    private lazy var bottomAccountLabel: UILabel = {
        let lbl = UILabel()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString.String("Don't have an account? ", font: .Regular, color: .lightGray))
        attributedString.append(NSAttributedString.String("Create one", font: .Semibold, color: .white))
        
        lbl.attributedText = attributedString
        lbl.isUserInteractionEnabled = true
        lbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bottomAccountLabelTapped)))
        return lbl
    }()
    
    private lazy var signUpView: SignUpView = {
        let view = SignUpView()
        return view
    }()
    
    private var heightConstraint: NSLayoutConstraint!
    
    private let emailContainerView = UIView()
    private let passwordContainerView = UIView()
    
    private var isSignUpForm = false
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .Background
        
        
        view.add(subview: logoimageView) { (v,p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 50),
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.heightAnchor.constraint(equalTo: p.widthAnchor, multiplier: 0.5),
            v.widthAnchor.constraint(equalTo: p.widthAnchor, multiplier: 0.5)
            
            ]}
        
        // Email Constraints
        view.add(subview: emailContainerView) { (v, p) in [
            v.topAnchor.constraint(equalTo: logoimageView.bottomAnchor, constant: 30),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 50),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -50),
            v.heightAnchor.constraint(equalToConstant: 55)
            
            ]}
        
        emailContainerView.add(subview: emailImageView) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.heightAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.5),
            v.widthAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.5)
            
            ]}
        
        emailContainerView.add(subview: emailVertificationImageView) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -5),
            v.heightAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.5),
            v.widthAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.5)
            
            ]}
        
        emailContainerView.add(subview: emailTextField) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.topAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor),
            v.leadingAnchor.constraint(equalTo: emailImageView.trailingAnchor, constant: 20),
            v.trailingAnchor.constraint(equalTo: emailVertificationImageView.leadingAnchor, constant: -10)
            
            ]}

        emailContainerView.addSeparatorLine(color: .lightGray)
        
        
        // Password Constraints
        view.add(subview: passwordContainerView) { (v, p) in [
            v.topAnchor.constraint(equalTo: emailContainerView.bottomAnchor, constant: 30),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 50),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -50),
            v.heightAnchor.constraint(equalToConstant: 55)
            
            ]}
        
        passwordContainerView.add(subview: passwordImageView) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.heightAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.5),
            v.widthAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.5)
            
            ]}
        
        passwordContainerView.add(subview: passwordVertificationImageView) { (v, p) in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -5),
            v.heightAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.5),
            v.widthAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.5)
            
            ]}
        
        passwordContainerView.add(subview: passwordTextField) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.topAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor),
            v.leadingAnchor.constraint(equalTo: passwordImageView.trailingAnchor, constant: 20),
            v.trailingAnchor.constraint(equalTo: passwordVertificationImageView.leadingAnchor, constant: -10)
            
            ]}
        
        passwordContainerView .addSeparatorLine(color: .lightGray)
        
        // VertificationButton Constraints
        view.add(subview: vertificationButton) { (v, p) in [
            v.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 30),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 50),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -50),
            v.heightAnchor.constraint(equalToConstant: 55)
            ]}
       
        // forgotPWLabel Constraints
        view.add(subview: forgotPWLabel) { (v, p) in [
           v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
           v.topAnchor.constraint(equalTo: vertificationButton.bottomAnchor, constant: 15)
            ]}
        
        // bottomAccountLabel Constraints
        view.add(subview: bottomAccountLabel) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor, constant: -20)
            ]}

        // signUpView Constraints
        heightConstraint = signUpView.heightAnchor.constraint(equalToConstant: 0)
        
        view.add(subview: signUpView) { (v, p) in [
            v.bottomAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor),
            heightConstraint
            ] }

        
    }
    
    @objc private func vertificationButtonTapped() {
         // Check if it the Sign In form or the Sign Up form
         // if it is Sign In the check Firebase authentication if the form is valid
        
        if isSignUpForm {
            heightConstraint.constant = view.frame.height * 0.4
            UIView.animate(withDuration: 0.25) {
                self.signUpView.nameTextField.alpha = 1
                self.signUpView.sendButton.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func bottomAccountLabelTapped() {
        if !isSignUpForm {
            vertificationButton.setTitle("Create new account", for: .normal)
            
            let attributedString = NSMutableAttributedString(attributedString: NSAttributedString.String("Already have an account ", font: .Regular, color: .lightGray))
            attributedString.append(NSAttributedString.String("Sign in", font: .Semibold, color: .white))
            
            bottomAccountLabel.attributedText = attributedString
        } else {
            vertificationButton.setTitle("Sign in", for: .normal)
            
            let attributedString = NSMutableAttributedString(attributedString: NSAttributedString.String("Don't have an account? ", font: .Regular, color: .lightGray))
            attributedString.append(NSAttributedString.String("Create one", font: .Semibold, color: .white))
            
            bottomAccountLabel.attributedText = attributedString
        }
        
        UIView.animate(withDuration: 0.25) {
            self.forgotPWLabel.alpha = self.isSignUpForm ? 1 : 0
        }
        
        isSignUpForm = !isSignUpForm
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
}
