//
//  ParsingJsonController.swift
//  JsonSample
//
//  Created by Maru on 13/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ParsingJsonController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let astronauts = "http://api.open-notify.org/astros.json"  // 우주비행사 정보
    let apiURL = URL(string: astronauts)!
    
    let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else {
            print("StatusCode is not valid")
            return
        }
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String: Any]
            else { return print("No Data") }
        print("jsonObject :", jsonObject)
        
        guard (jsonObject["message"] as? String) == "success",
            let people = jsonObject["people"] as? [[String: String]],
            let peopleCount = jsonObject["number"] as? Int
            else { return print("Parsing Error") }
        
        print("\n---------- [ Parsing Success ] ----------\n")
        print("총 \(peopleCount)명의 우주비행사가 탑승 중입니다.")
        
        print("= 우주비행사 명단 =")
        people
            .compactMap { $0["name"] }
            .forEach { print($0) }
    }
    
    dataTask.resume()

}
