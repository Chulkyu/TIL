//
//  ViewController1.swift
//  JsonSample
//
//  Created by Maru on 13/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        writeJSON()
       dataWithJSONObject()
    }
    
    // 파일 통으로 작성 및 수정
    func writeJSON() {
        let jsonObject = ["hello": "world", "foo": "bar", "iOS": "Swift"]
        guard JSONSerialization.isValidJSONObject(jsonObject) else { return }
        
        let jsonFilePath = "myJsonFile.json"
        let outputJSON = OutputStream(toFileAtPath: jsonFilePath, append: false)!
        outputJSON.open()
        _ = JSONSerialization.writeJSONObject(
            jsonObject,
            to: outputJSON,
            options: [.prettyPrinted],
            error: nil)
        outputJSON.close()
        
        do {
            let jsonString = try String(contentsOfFile: jsonFilePath)
            print(jsonString)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    func dataWithJSONObject() {
        let jsonObject: [String: Any] = [
            "someNumber": 1,
            "someString": "Hello",
            "someArray": [1, 2, 3],
            "someDict": [
                "someBool": true
            ]
        ]
        
        guard JSONSerialization.isValidJSONObject(jsonObject) else { return }
        
        do {
            // json 형태의 data로 변환 : 서버로 보낼 때
            let encoded = try JSONSerialization.data(withJSONObject: jsonObject)
            
            // json 형태의 data를 swift 형태로 변환 : 서버에서 받을 때
            let decoded = try JSONSerialization.jsonObject(with: encoded)
            if let jsonDict = decoded as? [String: Any] {
                print(jsonDict)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }

    
    // 파일 안의 내용 세부적으로 수정
    func inputStream() {
        let jsonFilePath = "myJsonFile.json"
        let inputStream = InputStream(fileAtPath: jsonFilePath)!
        inputStream.open()
        defer { inputStream.close() }
        
        guard inputStream.hasBytesAvailable else { return }
        
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: inputStream) as? [String: Any] {
                print(jsonObject)
            }
        } catch {
            print(error.localizedDescription)
        }

        
    }
    

}
