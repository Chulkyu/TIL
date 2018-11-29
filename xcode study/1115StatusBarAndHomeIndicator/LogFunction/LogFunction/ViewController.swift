//
//  ViewController.swift
//  LogFunction
//
//  Created by Maru on 15/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

// Free Function (print, min, max ...)
// #file, #function, #line, #column


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#file)
        print(#function)
        print(#line)
        print(#column)
        info("Hello world")
        info("Hello world", header: "My Logger")
        
    }

    func info(
        _ contents: Any..., // Variadic Parameter
        header: String = "",
        _ file: String = #file,
        _ function: String = #function,
        _ line: Int = #line
        ) {
        
    let emoji = "🤣🥶"
        
    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss:SS"
    let timestamp = dateFormatter.string(from: Date())
        
    let fileUrl = URL(fileURLWithPath: file)
    let filenName = fileUrl.deletingPathExtension().lastPathComponent
    
    let header = header.isEmpty ? "" : " [\(header) ] -"
    let content = contents.reduce("") { $0 + " " + String(describing: $1) }
        
        print("\(emoji) \(timestamp) \(filenName) \(function) \(line) \(emoji) \(header) \(content)")
    }
}

