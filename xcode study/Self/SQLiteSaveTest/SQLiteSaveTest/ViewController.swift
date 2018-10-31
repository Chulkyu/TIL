//
//  ViewController.swift
//  SQLiteSaveTest
//
//  Created by Maru on 29/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var birth: UITextField!
    
    var databasesPath: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 앱이 실행되면 데이터베이스 파일이 존재하는지 확인하고
           존재하지 않으면 데이터 파일과 테이블을 생성한다. */
        
        let filemgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        
        databasesPath = docsDir.appending("/contact.db")
        // 데이터베이스 파일이 존재하지 않으면 데이터베이스 파일 생성
        if !filemgr.fileExists(atPath: databasesPath!) {
            let contactDB = FMDatabase(path: databasesPath)
            // 데이터베이스를 열고 contacts 테이블을 생성한다.
            if contactDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT, BIRTH TEXT)"
                if !contactDB.executeStatements(sql_stmt) {
                    print("Error \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error \(contactDB.lastErrorMessage())")
            }
        }
        
    }

    
    @IBAction func saveData(_ sender: Any) {
        
        let contactDB = FMDatabase(path: databasesPath)
        
        if contactDB.open() {
            let insertSQL = "INSERT INTO CONTACTS (name, address, phone, birth) VALUES ('\(name.text!)', '\(address.text!)', '\(phone.text!)', '\(birth.text!)')"
            
            let result = contactDB.executeUpdate(insertSQL, withArgumentsIn: [])
            
            if !result {
                status.text = "Failed to add contact"
                print("Error \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Contact Added"
                name.text = ""
                address.text = ""
                phone.text = ""
                birth.text = ""
            }
        } else {
            print("Error \(contactDB.lastErrorMessage())")
        }
    }
    
    
    @IBAction func loadData(_ sender: Any) {
        
        let contactDB = FMDatabase(path: databasesPath)
        
        if contactDB.open() {
            let querySQL = "SELECT address, phone, birth FROM CONTACTS WHERE name = '\(name.text!)'"
            
            let result: FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsIn: [])
            // next 메서드는 일치하는 레코드가 적어도 하나 이상인지 확인하기 위함
            if result?.next() == true {
                address.text = result?.string(forColumn: "address")
                phone.text = result?.string(forColumn: "phone")
                birth.text = result?.string(forColumn: "birth")
                status.text = "Record Found"
            } else {
                status.text = "Record not found"
                address.text = ""
                phone.text = ""
                birth.text = ""
            }
            contactDB.close()
        } else {
            print("Error \(contactDB.lastErrorMessage())")
        }
    }
    

}

