//: Playground - noun: a place where people can play

import UIKit

var input = [5, 6, 1, 3, 10, 2, 7, 14, 9]

//======== Bubble Sort ====================

//for f in 1..<input.count - 1 {
//    for s in input {
//        if s > input[f] {
//            input.swapAt(f-1, f)
//        } else if input[f] > input[f+1] {
//            input.swapAt(f, f+1)
//        }
//    }
//}
//
//print(input)



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
//print(input)
// ======================================

//============= Selection Sort ==============
 var select = [5, 6, 1, 3, 10, 2, 7, 14, 9]


for i in 0..<select.count {
//    print(select)
    for index in (i + 1)..<select.count {
        if select[i] < select[index] {
        } else {
            for min in (index+1)..<select.count {
                if select[index] < select[min] {
                    select.swapAt(index, i)
                }
            }
            
        }
        
    }
}
print(select)

// ===========================================

//============= Insert Sort ===================

var insert = [5, 6, 1, 3, 10, 2, 7, 14, 9]

for i in 1..<insert.count {
       for idx in 0..<i {
        if insert[i] < insert[idx] {
            insert.insert(insert[i], at: idx)
            insert.remove(at: i+1)
        }
    }
}

print(insert)

// =============================================


