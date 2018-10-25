//: Playground - noun: a place where people can play

import UIKit

class Node {
    let value: String
    var next: Node?
    init(value: String) {
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    var isEmpty: Bool {
        return head == nil
    }
    var size: Int {
        return 0
    }
    
    func push(node: Node) {
        
        if isEmpty {
            head = node
        } else {
            while head?.next == nil {  }
        }
    } // 데이터 삽입
    func pop() -> String? { return "pop" }  // 데이터 반출.
    func peek() -> String? { return "peak" } // 마지막 데이터 확인
}


let list = LinkedList()
list.push(node: Node(value: "1"))



var a = [Int]()
var b = [Int]()

a.append(1)
a.append(2)
a.append(3)
a.append(4)

a.first
a.endIndex



