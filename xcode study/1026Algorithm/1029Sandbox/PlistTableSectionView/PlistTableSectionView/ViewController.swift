//
//  SecondViewController.swift
//  Plist
//
//  Created by Maru on 29/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var data: [String : [String]] = [:]
    
    struct Objects {
        var sectionName: String
        var sectionObjects: [String]
    }
    
    var objectArray = [Objects]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         handleBundleFile()
        
        for (key, values) in data {
            objectArray.append(Objects(sectionName: key, sectionObjects: values))
        }
        //        propertyListSerialization()
       
       print(data)
       print(objectArray)

    }
    
    private func handleBundleFile() {
        guard let path = Bundle.main.path(forResource: "IdolsGroup", ofType: "plist"),
            let contents = NSDictionary(contentsOfFile: path) as? [String : [String]] else { return }
        data = contents

        
        //        print("IdolsGroup file path :", path)
        //        print(contents)
        //
        //        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //        let destPath = documentPath + "/copied.plist"
        //
        //        let fileManager = FileManager.default
        //        if !fileManager.fileExists(atPath: destPath) {
        //            do {
        //                try fileManager.copyItem(atPath: path, toPath: destPath)
        //            } catch {
        //                print("파일 복사 에러 :", error.localizedDescription)
        //            }
        //        }
        //
        //        if let files = try? fileManager.contentsOfDirectory(atPath: documentPath) {
        //            print("\(files.count) Files in Documents: \(files)")
        //        }
        //
        //        print("\n--------[ Load & Change Data ]---------\n")
        //
        //        guard var copiedData = NSDictionary(contentsOfFile: destPath) as? [String : [String]] else { return }
        //
        //        let newData = "비욘세"
        //        if !copiedData.contains(newData) {
        //            copiedData.append(newData)
        //            (copiedData as NSArray).write(toFile: destPath, atomically: true)
        //
        //            }
        //
        //        if let newContents = NSArray(contentsOfFile: destPath) as? [String] {
        //            data = newContents
        //            print(newContents)
        //        }
        
    }
    
    //    private func propertyListSerialization() {
    //        print("\n-------- [ propertyListSerialzation ] --------\n")
    //
    //        guard let path = Bundle.main.path(forResource: "IdolsGroup", ofType: "plist"),
    //            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
    
    //        if var list = try? PropertyListSerialization.propertyList(from: data, format: nil) as! [String : [String]] {
    //            list.updateValue(["비욘세"], forKey: "Girl")
    //
    //            let newList = try!
    //            PropertyListSerialization.data(fromPropertyList: list, format: .xml, options: 0)
    //            let url = URL(fileURLWithPath: path)
    //            try! newList.write(to: url)
    //            print("url :", url)
    //
    //            self.data = list
    //        }
    
}





// UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        return cell
    }
    
    
    
    
    
    
    
}



