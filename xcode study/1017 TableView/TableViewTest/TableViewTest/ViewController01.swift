//
//  ViewController.swift
//  TableViewTest
//
//  Created by Maru on 18/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController01: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var data = Array(1...20)
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    @objc func reloadData() {
        print("reload")
        data.reverse()
        
        if (tableView.refreshControl?.isRefreshing)! {
            self.tableView.refreshControl?.endRefreshing()
        }
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// 테이블뷰 필수! Datasource
extension ViewController01: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: String)
        
        
        // 스토리보드로 tableView 만들었을 때 무조간 사용하는 코드
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        count += 1
        cell.textLabel?.text = "\(indexPath)"
        print(cell.textLabel?.text ?? "0")
        return cell
        
        
 /* cell이 재사용 되지 않고 계속 생성
         
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        count += 1
        cell.textLabel?.text = "\(count)"

        return cell
 
 */
        
    }
}

// Mark: UITableViewDelegate

extension ViewController01: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("indexPath: ", indexPath)
        
        let cell = tableView.cellForRow(at: indexPath)
        print(cell?.textLabel?.text ?? "0")
    }
}
