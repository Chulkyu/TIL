//
//  SignUpViewController.swift
//  SelfProject
//
//  Created by Maru on 23/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, SignUpViewDelegate {
    
    var databasesPath: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filemgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    
        let docsDir = dirPaths[0] as String
        
        databasesPath = docsDir.appending("/contact.db")
        // 데이터베이스 파일이 존재하지 않으면 데이터베이스 파일 생성
        if !filemgr.fileExists(atPath: databasesPath!) {
           let contactDB = FMDatabase(path: databasesPath)
            // 데이터베이스를 열고 contacts 테이블을 생성한다.
            if contactDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT,ID TEXT, PASSWORD TEXT,  NAME TEXT, BIRTH TEXT, ADDRESS TEXT)"
                if !contactDB.executeStatements(sql_stmt) {
                    print("Error \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error \(contactDB.lastErrorMessage())")
            }
        }
        
    }
    
    func confirm(_ userData: SignUpView) {
        print("Save UserData")

        let contactDB = FMDatabase(path: databasesPath)
        
        if contactDB.open() {
            let insertSQL = "INSERT INTO CONTACTS (ID, Password, Name, Birth, Address) VALUES ('\(SignUpView.SignUpViewID.text!)', '\(SignUpView.SignUpViewPassword.text!)', '\(address.text!)')"
        }
        
        
        
    }
    
    func search(_ userData: SignUpView) {
        print("Search UserData")
    }
    
    
    
    
    
}
