//
//  SignUpViewController.swift
//  SelfProject
//
//  Created by Maru on 23/10/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var databasesPath: String?
    //    let signUpView = SignUpView()
    
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var checkPassword: UITextField!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var birth: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.addSubview(signUpView)
        //        signUpView.delegate = self
        //      signUpView.signUpViewLabel.text! = "Welcome!!!"
        
        
        
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
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, ID TEXT, PASSWORD TEXT, CHECKPASSWORD TEXT, NAME TEXT, BIRTH TEXT, ADDRESS TEXT)"
                if !contactDB.executeStatements(sql_stmt) {
                    print("Error \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error \(contactDB.lastErrorMessage())")
            }
        }
        
    }
    
    
    
    @IBAction func confirm(_ sender: Any) {
        let contactDB = FMDatabase(path: databasesPath)
        
        if contactDB.open() {
            let insertSQL = "INSERT INTO CONTACTS (ID, Password, CheckPassword, Name, Birth, Address) VALUES ('\(id.text!)', '\(password.text!)', '\(checkPassword.text!)', '\(name.text!)', '\(birth.text!)', '\(address.text!)')"
            
            let result = contactDB.executeUpdate(insertSQL, withArgumentsIn: [])
            
            if !result {
                status.text = "Failed to add contact"
                print("Error \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Contact Added"
                id.text = ""
                password.text = ""
                checkPassword.text = ""
                name.text = ""
                birth.text = ""
                address.text = ""
            }
        }else {
            print("Error \(contactDB.lastErrorMessage())")
            
        }
        
        
    }
    
    
    @IBAction func search(_ sender: Any) {
        
        let contactDB = FMDatabase(path: databasesPath)
        
        if contactDB.open() {
            let querySQL = "SELECT birth, address FROM CONTACTS WHERE name = '\(name.text!)"
            
            let result: FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsIn: [])
            // next 메서드는 일치하는 레코드가 적어도 하나 이상인지 확인하기 위함
            if result?.next() == true {
                birth.text = result?.string(forColumn: "birth")
                address.text = result?.string(forColumn: "address")
                status.text = "Record Found"
            } else {
                status.text = "Record not found"
                birth.text = ""
                address.text = ""
            }
            contactDB.close()
        } else {
            print("Error \(contactDB.lastErrorMessage())")
        }
        
    }
    
}





//extension SignUpViewController: SignUpViewDelegate {
//
//    func confirm(_ userData: SignUpView) {
//        print("Save UserData")
//
//        let contactDB = FMDatabase(path: databasesPath)
//
//        if contactDB.open() {
//            let insertSQL = "INSERT INTO CONTACTS (ID, Password, Name, Birth, Address) VALUES ('\(userData.signUpViewID.text!), '\(userData.signUpViewPassword.text!), \(userData.signUpViewName.text!), \(userData.signUpViewBirth.text!), \(userData.signUpViewAddress.text!)"
//
//            let result = contactDB.executeUpdate(insertSQL, withArgumentsIn: [])
//
//            if !result {
//                userData.signUpViewLabel.text = "Failed to add contact"
//                print("Error \(contactDB.lastErrorMessage())")
//            } else {
//                userData.signUpViewLabel.text = "Contact Added"
//                userData.signUpViewID.text = ""
//                userData.signUpViewPassword.text = ""
//                userData.signUpViewName.text = ""
//                userData.signUpViewBirth.text = ""
//                userData.signUpViewAddress.text = ""
//            }
//        }else {
//            print("Error \(contactDB.lastErrorMessage())")
//
//            }
//
//
//        }
//
//
//    func search(_ userData: SignUpView) {
//        print("Search UserData")
//
//        let contactDB = FMDatabase(path: databasesPath)
//
//        if contactDB.open() {
//            let querySQL = "SELECT birth, address FROM CONTACTS WHERE name = '\(userData.signUpViewName.text!)"
//
//            let result: FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsIn: [])
//            // next 메서드는 일치하는 레코드가 적어도 하나 이상인지 확인하기 위함
//            if result?.next() == true {
//                userData.signUpViewBirth.text = result?.string(forColumn: "birth")
//                userData.signUpViewAddress.text = result?.string(forColumn: "address")
//                userData.signUpViewLabel.text = "Record Found"
//            } else {
//                userData.signUpViewLabel.text = "Record not found"
//                userData.signUpViewBirth.text = ""
//                userData.signUpViewAddress.text = ""
//            }
//            contactDB.close()
//        } else {
//            print("Error \(contactDB.lastErrorMessage())")
//        }
//
//    }
//
//
//
//}




