//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

// MARK: - Extensions for Queue struct
extension Queue {
    
    ///Check whether arrays is empty or no
    var isEmpty: Bool {
        items.isEmpty
    }
    
    ///Adding a new item in the end of array
    mutating func addItem(item: T) {
        items.append(item)
    }

    ///Remove the last item from array
    mutating func removeItem() {
        items = items.dropLast()
    }
    
    ///Remove an item from array at given position
    mutating func removeItem(at: Int) {
        items.remove(at: at)
        
    }
    
    ///Return new array with mapped values
    mutating func myMap(closure: (T) -> T) -> [T] {
        var mappedArray = Queue<T>()
        for item in items {
            mappedArray.items.append(closure(item))
        }
        return mappedArray.items
    }
    
    ///Return new array with filtered values
    mutating func myFilter(closure: (T) -> Bool) -> [T] {
        var filteredArray = Queue<T>()
        for item in items where closure(item) {
            filteredArray.items.append(item)
        }
        return filteredArray.items
    }
    
    subscript(index: Int) -> T? {
        guard index >= 0, index < items.count else { return nil }
        return items[index]
    }
}

extension Queue where T: Comparable {
    
    ///Return sorted array
    mutating func sort() {
        items.sort()
    }
    
    ///Return minimal value of array
    mutating func min() -> T? {
        if let min = items.min() {
            return min
        } else {
            return nil
        }
    }
}

extension Queue where T: Numeric {
    
    ///Return reduced value
    mutating func myReduce(_ startValue: T, _ closure: (T) -> T) -> T {
        var reducedValue = startValue
        for item in items {
           reducedValue += closure(item)
        }
        return reducedValue
    }
}

// MARK: - Custom struct Queue
public struct Queue<T> {
    
    var items: [T] = []
}


var arrayOfInts = Queue<Int>()
arrayOfInts.addItem(item: 4)
arrayOfInts.addItem(item: 2)
print(arrayOfInts.items)
arrayOfInts.addItem(item: 5)
print(arrayOfInts.items)
arrayOfInts.sort()
print(arrayOfInts.items)
let mapped = arrayOfInts.myMap { $0 * $0 }
print(mapped)
let filtered = arrayOfInts.myFilter { $0 > 2 }
let reducedPlus = arrayOfInts.myReduce(0, +)
print(reducedPlus)
let reducedMinus = arrayOfInts.myReduce(20, -)
print(reducedMinus)

print(arrayOfInts.items)
print(arrayOfInts.isEmpty)
print(arrayOfInts.items.min())
print(arrayOfInts[8])
print(arrayOfInts.items.count)

var arrayOfStrings = Queue<String>()
arrayOfStrings.addItem(item: "String 1")
arrayOfStrings.addItem(item: "String 2")
arrayOfStrings.addItem(item: "String 3")
arrayOfStrings.removeItem(at: 1)
print(arrayOfStrings.items)


var arrayOfBools = Queue<Bool>()
arrayOfBools.addItem(item: true)
arrayOfBools.addItem(item: false)




