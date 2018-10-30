//: Playground - noun: a place where people can play

import UIKit

var input = [5, 6, 1, 3, 10, 2, 7, 14, 9]

for f in 1..<input.count - 1 {
    for s in input {
        if s > input[f] {
            input.swapAt(f-1, f)
        } else if input[f] > input[f+1] {
            input.swapAt(f, f+1)
        }
    }
}

print(input)



for i in 1..<input.count {
    var isSorted = true
    
    for idx in 0..<input.count - i {
        if input[idx] > input[idx + 1] {
            input.swapAt(idx, idx + 1)
            isSorted = false
        }
    }
    guard !isSorted else { break }
}

print(input)




