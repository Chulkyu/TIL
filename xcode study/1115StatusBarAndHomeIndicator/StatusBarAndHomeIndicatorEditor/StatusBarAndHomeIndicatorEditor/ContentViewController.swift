



//
//  ContentViewController.swift
//  StatusBarAndHomeIndicatorEditor
//
//  Created by Maru on 15/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    private var statusBarStyle = UIStatusBarStyle.default
    private var isStatusBarHidden = false
    private var ishomeIndicatorAutoHidden = false
    
    // MARK: StatusBar
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle // default - black
    }
    
    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }
    
    // 작성 안할 시 fade가 기본값
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
        
    }
    
    
    // MARK: HomeIndicator
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return ishomeIndicatorAutoHidden
    }
    
    
    
    
    
    // MARK: Action Handler
    
    @IBAction private func toggleStatusBarStyle(_ sender: Any) {
        let isDefault = statusBarStyle == .default
        statusBarStyle = isDefault ? .lightContent : .default
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = !isDefault ? .white : .darkGray
            self.setNeedsStatusBarAppearanceUpdate() // statusbar 상태 업데이트 반드시 해줘야함
        }
    }
    
    @IBAction private func toggleStatusBarHidden(_ sender: Any) {
        isStatusBarHidden.toggle()
        UIView.animate(withDuration: 0.5) {
            self.setNeedsStatusBarAppearanceUpdate()
            self.navigationController?.navigationBar.isHidden.toggle()
        }
    }
    
    @IBAction private func toggleHomeIndicatorHidden(_ sender: Any) {
        ishomeIndicatorAutoHidden.toggle()
        setNeedsUpdateOfHomeIndicatorAutoHidden()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    

}
