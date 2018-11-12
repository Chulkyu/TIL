//
//  ViewController.swift
//  ErrorHandlingTest
//
//  Created by Maru on 08/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let tmDir = NSTemporaryDirectory()
    private let filePath = NSTemporaryDirectory() + "swift.txt"
    private let errorFilePath = NSTemporaryDirectory() + "errorFile.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        createDummyFile()
        basic()
    }
    
    private func createDummyFile() {
        let str = "Swift Error Handling"
        try? str.write(toFile: filePath, atomically: true, encoding: .utf8)
    }
    
    private func basic() {
        print("\n------------ [ basic ] -------------\n")
        
        let str = "Swift Error Handling"
        do {
            try str.write(toFile: filePath, atomically: true, encoding: .utf8)
            try str.write(toFile: tmDir, atomically: true, encoding: .utf8)
        } catch {
            print(error)
            print(error.localizedDescription)  // 파일을 안만들고 디렉토리 파일에다가 실행해서 에러
        }
    }
    
    private func threeTypesOfTry() {
        print("\n------------ [ try types ] -------------\n")
        /****************************************************
            try vs try? vs try!
        *****************************************************/
        
        // 1. try
        // do ~ catch 없이 단독 사용 불가.
        
        // 2. try?
        // 성공하면 Optional 값 반환, 에러가 발생하면 nil 반환
        let contentsOptional = try? String(contentsOfFile: filePath)
        let contentsError = try? String(contentsOfFile: errorFilePath)
        print(contentsOptional ?? "")
        print(contentsError ?? "")
        
        // 3. try!
        // Optional 강제 언래핑. 단, 에러 발생 시 crash. 오류가 없다고 확신할 수 있는 경우만 사용
        let contentsUnwrapped = try! String(contentsOfFile: filePath)
//        let UnwrappeError = try! String(contentsOfFile: errorFilePath)
        print(contentsUnwrapped)
//        print(UnwrappeError)
        
        
        do {
            // 반드시 실행
            _ = try? String(contentsOfFile: errorFilePath)
            // 반드시 실행
            _ = try? String(contentsOfFile: errorFilePath)
            
            // 위에서 에러 나면 실행 안 될 수 있음
        } catch {
            
        }
        
        
    }
    
    private func throwNSError() throws {
        throw NSError(domain: "domain data", code: 99, userInfo: ["MyKey" : "MyValue"])
    }
    
    private func throwError() throws {
        throw MyError.errorWithParam(num: 10)
    }
    
    enum MyError: Error {
        case errorExample
        case errorWithParam(num: Int)
    }
    
    private func throwsFunctionExample() {
        print("\n------------ [ NSError ] -------------\n")
        
        do {
            try throwNSError()
        } catch {
            print("Error :", error)
            
            let e = error as NSError
            print("NSError :", e)
            print("domain :", e.domain)
            print("code :", e.code)
            print("userInfo :", e.userInfo)
            
        }
        
    }
    
    
    private func throwsErrorExample() {
        do {
            try throwError()
        } catch let err {
            print("Error :", err)
            print("Error Desc :", err.localizedDescription)
            
            let e = err as NSError
            print("NSError :", e)
            print("domain :", e.domain)
            print("code :", e.code)
            print("userInfo :", e.userInfo)
            
        }
    }
    
    
    private func errorMatching() {
        do {
            try throwError()
        } catch MyError.errorExample {
            print("Error Example")
        } catch MyError.errorWithParam(let num) {
            print("Error with number param :", num)
        } catch {
            print("The others")
        }
    }
    
    private func deferOrder() {
        print("\n------------ [ deferOrder ] -------------\n")
        print("start")
        defer { print("defer1")}
        print("center")
        defer { print("defer2")}
        defer { print("defer3")}
        print("end")
    }
    
    
    private func deferExample() {
        print("\n------------ [ deferExample ] -------------\n")
        defer { print("1) task1 - Must do something before return") }
        do {
            print("Do")
            try throwError()
            
        } catch {
            print("2) Error :", error)
            return
        }
        
        print("3) This is not called when error occurred")
        defer {
            print("4) defer - This is called when error occurred")
        }
        
        // OK -  3, 4, 1
        // Error - 2, 1  catch문 return에서 끝남
        
    }
    
    
}

