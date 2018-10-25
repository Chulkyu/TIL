//: Playground - noun: a place where people can play

import UIKit

struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}

let myPet = [
    Pet(type: .dog, age: 13),
    Pet(type: .dog, age: 2),
    Pet(type: .dog, age: 7),
    Pet(type: .cat, age: 9),
    Pet(type: .snake, age: 4),
    Pet(type: .pig, age: 5),
]



func dogAge() -> Int {
    var ageSum = 0
    for i in myPet {
        guard i.type == .dog else { continue }
        ageSum += i.age
    }
    return ageSum
}

func sum() -> Int {
    return myPet
        .filter { $0.type == .dog}
        .reduce(0) {$0 + $1.age}
}



func newAge() -> [Pet] {
    var newAge = [Pet]()
    for i in myPet {
        newAge.append(Pet(type: i.type, age: i.age + 1))
    }
    return newAge
}




let immutableArray = Array(1...40)

for (index, num) in immutableArray.enumerated() {
    print(index, num)
}

let result = immutableArray.enumerated().map({$0 * $1}).filter({$0 % 2 == 0}).reduce(0, +)
result



func multi() -> [Int] {
    var multiNum = [Int]()
    for (index, num) in immutableArray.enumerated() {
        multiNum.append(index * num)
        print(multiNum)
    }
    return multiNum
}
multi()

func evenNum(_ multiNum: [Int]) -> [Int] {
    var evenNum = [Int]()
    for even in multiNum {
        guard even % 2 == 0 else { continue }
        evenNum.append(even)
    }
    return evenNum
}
evenNum(multi())

func plusEvenNum(_ evenNum: [Int]) -> Int {
    var plus = 0
    for even in evenNum {
        plus += even
    }
    return plus
}

plusEvenNum(evenNum(multi()))

immutableArray.enumerated()


let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil, nil]]
//Q. map 과 flatMap, compactMap 을 이용하여 다음 결과를 출력해보세요.

// 1. [[Optional(1), Optional(2), Optional(3)], [nil, Optional(5)],   [Optional(6), nil], [nil, nil]]
let num1 = array.map({$0})
// let num1 = array.map({ $0.map({ $0 }) })
print(num1)

// 2. [[1, 2, 3], [5], [6], []] 
let num2 = array.map({ $0.compactMap({ $0 }) })
print(num2)

// 3. [Optional(1), Optional(2), Optional(3), nil, Optional(5), Optional(6), nil, nil, nil] 
let num3 = array.flatMap({ $0 })
print(num3)

//4. [1, 2, 3, 5, 6]

let num4 = array.flatMap({ $0 }).compactMap({ $0 })
print(num4)
