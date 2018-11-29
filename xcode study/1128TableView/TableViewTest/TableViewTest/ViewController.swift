//
//  ViewController.swift
//  TableViewTest
//
//  Created by Maru on 28/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = []
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videos = createArray()
    }

    func createArray() -> [Video] {
        
        var tempVideo: [Video] = []
        
        let video1 = Video(image: #imageLiteral(resourceName: "sample2"), title: "first")
        let video2 = Video(image: #imageLiteral(resourceName: "sample3"), title: "second")
        let video3 = Video(image: #imageLiteral(resourceName: "sample1"), title: "third")
        let video4 = Video(image: #imageLiteral(resourceName: "sample4"), title: "forth")
        
        tempVideo.append(video1)
        tempVideo.append(video2)
        tempVideo.append(video3)
        tempVideo.append(video4)
        
        return tempVideo
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        cell.setVideo(video: video)
        return cell
        
    }
    
    
    
}
