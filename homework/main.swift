//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

// 1.--------------------------------------
print("1.-----------------------------------------------")

func evenOrNot(number: Int) -> Bool {
    number % 2 == 0 ? true : false
}

print(evenOrNot(number: 5))

// 2.---------------------------------------
print("2.-----------------------------------------------")

func divideByThree(number: Int) -> Bool {
    number % 3 == 0 ? true : false
}

print(divideByThree(number: 15))

// 3. 4. ---------------------------------------
print("3. 4.--------------------------------------------")

var arrayOfDigits = [Int]()

for i in 0...100 {
    arrayOfDigits.append(i)
}

print(((arrayOfDigits.map { $0 % 2 == 0 ? 0 : $0 }).map { $0 % 3 == 0 ? $0 : 0}).filter { $0 != 0 })

// 5.--------------------------------------------
print("5.-----------------------------------------------")

var fibonacci = [0, 1]

func makeFibonacciArray() {
    for i in 2...49 {
        fibonacci.append(fibonacci[i-2] + fibonacci[i-1])
    }
}

makeFibonacciArray()

print(fibonacci)

// 6.-----------------------------------------------
print("6.-----------------------------------------------")

var simpleNumbers = Array(2...100)

var item = 0

while item <  simpleNumbers.count {
    let currentNumber = simpleNumbers[item]
    var nextNumber = simpleNumbers.suffix(from: item + 1)
    
    nextNumber.removeAll { $0 % currentNumber == 0}
    
    simpleNumbers = simpleNumbers.prefix(item + 1) + Array(nextNumber)
    item += 1
    
}

print(simpleNumbers)


