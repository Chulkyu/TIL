//
//  NewsScrollViewController.swift
//  LoginView
//
//  Created by Maru on 26/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class MovieInfoViewController: UIViewController {
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var productCompanyView: UIView!
    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var newsButton: UIButton!
    
    @IBOutlet weak var movieInfoButton: UIButton!
    
    @IBOutlet weak var tableView: UIView!
    
    var movieInfoData: [MovieInfo] = []
    
    
    var images = ["sample1.jpg", "sample2.jpg", "sample3.jpg", "sample4.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewSetting()
        borderSetting()
        movieInfoData = creatMovieInfo()
        
        
    }
    
    func creatMovieInfo() -> [MovieInfo] {
        
        var tempMovieInfo: [MovieInfo] = []
        
        let bohemianRhapsody = MovieInfo(director: "브라이언 싱어", actor: "레미 맬렉, 루시 보인턴, 귈림 리, 벤 하디, 조셉 마젤로", genre: "드라마", openDate: "2018.10.31",runningTime: "134분")
        tempMovieInfo.append(bohemianRhapsody)
        
        return tempMovieInfo
    }
    
    /***************************** scrollView Setting **********************************/
    private func scrollViewSetting() {
        // scroll view
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.image = UIImage(named: images[i])
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            
            imageView.frame = CGRect(x: xPosition, y: 0, width: view.frame.width, height: view.frame.height * 0.3)
            
            scrollView.contentSize.width = self.view.frame.width * CGFloat(1 + i)
            
            scrollView.addSubview(imageView)
            
        }
    }
    /************************************************************************************/
    
    /******************************* border Setting *************************************/
    private func borderSetting() {
        
        // view, button border setting
        productCompanyView.layer.addBorder([.top, .bottom], color: UIColor.lightGray, width: 1.0)
        buttonView.layer.addBorder([.bottom], color: UIColor.lightGray, width: 1.0)
        movieInfoButton.layer.addBorder([.bottom], color: UIColor.red, width: 2.0)
    }
    
    
    @IBAction private func newsButtonDidTap(_ sender: UIButton) {
        newsButton.layer.addBorder([.bottom], color: UIColor.red, width: 2.0)
        movieInfoButton.layer.addBorder([.bottom], color: UIColor.white, width: 2.0)
        
    }
    
    @IBAction private func MovieInfoButtonDidTap(_ sender: UIButton) {
        movieInfoButton.layer.addBorder([.bottom], color: UIColor.red, width: 2.0)
        newsButton.layer.addBorder([.bottom], color: UIColor.white, width: 2.0)
        
    }
    
}
/************************************************************************************/



// 중간 view border line
extension UIView{
    @IBInspectable var borderWidth1: CGFloat {
        set {
            layer.borderWidth = newValue
        } get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius1: CGFloat {
        set {
            layer.cornerRadius = newValue
        } get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor1: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        } get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}

// button border line set
extension UIButton {
    @IBInspectable var buttonBorderWidth1: CGFloat {
        set {
            layer.borderWidth = newValue
            
        } get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var buttonCornerRadius1: CGFloat {
        set {
            layer.cornerRadius = newValue
        } get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var buttonBorderColor1: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        } get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}


// border 원하는 곳만 설정하는 코드
extension CALayer {
    func addBorder1(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}

extension MovieInfoViewController: UITableViewDataSource, UITableViewDelegate {



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfoData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = movieInfoData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieInfoViewCell") as! MovieInfoViewCell
        cell.setMovieInfo(movieInfo: data)
        
        return cell
    }



}