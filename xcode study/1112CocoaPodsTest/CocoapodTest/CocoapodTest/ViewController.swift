//
//  ViewController.swift
//  CocoapodTest
//
//  Created by Maru on 12/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit
import Alamofire
import CircleMenu
import Kingfisher

class ViewController: UIViewController {
    
    private let imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var circle: CircleMenu!
    
    let items: [(icon: String, color: UIColor)] = [
        ("btn_home", UIColor(red: 0.19, green: 0.57, blue: 1, alpha: 1)),
        ("btn_search", UIColor(red: 0.22, green: 0.74, blue: 0, alpha: 1)),
        ("btn_notification", UIColor(red: 0.96, green: 0.23, blue: 0.21, alpha: 1)),
        ("btn_setting", UIColor(red: 0.51, green: 0.15, blue: 1, alpha: 1)),
        ("btn_location", UIColor(red: 1, green: 0.39, blue: 0, alpha: 1))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circle.layer.cornerRadius = circle.frame.width / 2
        
        //        urlSession()
//        alamofire()
                kingfisher()
    }
    
    func urlSession() {
        guard let url = URL(string: imageURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else { return }
            guard let data = data else { return }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
        task.resume()
    }
    
    func alamofire() {
        Alamofire.request(imageURL)
            .validate(statusCode: 200..<400)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: value)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
        
    }
    
    func kingfisher() {
        guard let url = URL(string: imageURL) else { return }
        imageView.kf.setImage(with: url)
    }
    
    
    
}

extension ViewController: CircleMenuDelegate {
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
    }
}
