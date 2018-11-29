//
//  ViewController.swift
//  Codable Practice
//
//  Created by Maru on 20/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        encoderData()
        decodable()
    }

    
    struct Person: Codable {
        var name: String
        var age: Int
    }
    
    let jsonString = """
{
"name" : "maru",
"age" : 2
}
"""
    
    func encoderData() {
        let encoder = JSONEncoder()
        let maru = Person(name: "maru", age: 2)
        encoder.outputFormatting = .prettyPrinted
        let jsonData = try? encoder.encode(maru)
        if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    }
    
    func decodable() {
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        if let data = data, let myPerson = try? decoder.decode(Person.self, from: data) {
            print(myPerson.name)
            print(myPerson.age)
        }
    }

    
    
    
    
    
}

