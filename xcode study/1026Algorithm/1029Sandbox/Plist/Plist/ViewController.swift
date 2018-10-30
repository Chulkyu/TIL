//
//  ViewController.swift
//  Plist
//
//  Created by Maru on 29/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var data: [String] = []
    
    @IBOutlet weak var idolsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        printPath()
//        handleBundleFile()
        propertyListSerialization()
    }
    
    private func printPath() {
        print("\n-------- [ print path ] ---------\n")
        
        let bundlePath = Bundle.main.bundlePath
        print("[ Bundle ] :", bundlePath)
        
        // 데이터 컨테이너 홈 디렉토리
        let homePath = NSHomeDirectory()
        print("[ Home ] :", homePath)
        
        // 도큐먼트 디렉토리
        let documentPath = NSHomeDirectory() + "/Documents"
        let _ = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let _ = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        print("[ Document ] :", documentPath)
        
//        let diff1 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let diff2 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, false)[0]
//        print(diff1)
//        print(diff2)
        
        let libraryPath = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
        print("[ libraryPath ] :", libraryPath)
        
        let cachePath1 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let cachePath2 = FileManager.default.urls(for: .cachesDirectory, in: .allDomainsMask)
        
        print("[ Cache User Domain ] :", cachePath1)
        print("[ Cache All Domain ] :", cachePath2)
        
        let applicationSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        print("[ ApplicationSupport ] :", applicationSupport)
        
        let tmpPath = NSTemporaryDirectory()
        print("[ Temp ] :", tmpPath)
        
        
    }
    
    private func handleBundleFile() {
        print("\n--------- [ Bundle Data ] ------------\n")
        
        guard let path = Bundle.main.path(forResource: "idols", ofType: "plist"),
        let contents = NSArray(contentsOfFile: path) as? [String]
            else { return }
        
        print("idols file path :", path)
        print(contents)
        data = contents
        
        
        
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let destPath = documentPath + "/copied.plist"
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: destPath) {
            do {
                try fileManager.copyItem(atPath: path, toPath: destPath)
            } catch {
                print("파일 복사 에러 :", error.localizedDescription)
            }
        }
        
        if let files = try? fileManager.contentsOfDirectory(atPath: documentPath) {
            print("\(files.count) Files in Documents: \(files)")
        }
        
        print("\n--------[ Load & Change Data ]---------\n")

        guard var copiedData = NSArray(contentsOfFile: destPath) as? [String] else { return }
        // idols.plist = 읽기 전용/ 쓰기도 가능하지만 다음 번에 재실행 시 다시 초기 상태로 사용하게 됨
        // copied.plist = 읽기 및 쓰기 가능
        
        let newData = "아이유"
        if !copiedData.contains(newData) {
            copiedData.append(newData)
            (copiedData as NSArray).write(toFile: destPath, atomically: true)
        }
        
        if let newContents = NSArray(contentsOfFile: destPath) as? [String] {
            data = newContents
            print(newContents)
        }
        
    }
    private func propertyListSerialization() {
        print("\n-------- [ propertyListSerialzation ] --------\n")
        
        guard let path = Bundle.main.path(forResource: "idols", ofType: "plist"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
        
        if var list = try? PropertyListSerialization.propertyList(from: data, format: nil) as! [String] {
            list.append("아이유")
            
            let newList = try! PropertyListSerialization.data(fromPropertyList: list, format: .xml, options: 0)
            let url = URL(fileURLWithPath: path)
            try! newList.write(to: url)
            print("url :", url)
            
            
//            guard let newData = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
//            if let newList = try? PropertyListSerialization.propertyList(from: newData, format: nil) as! 
            self.data = list
        }

    }
    
}

// UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}






