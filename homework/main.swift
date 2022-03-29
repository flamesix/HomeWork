//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

//Задание №1

print("Решение квадратного уравнения вида ax^2 + bx + c = 0")
print("Введите значение константы а:")
let a1 = readLine()
let a = Double(a1 ?? "")
print("Введите значение константы b:")
let b1 = readLine()
let b = Double(b1 ?? "")
print("Введите значение константы c:")
let c1 = readLine()
let c = Double(c1 ?? "")
var x = 0.0
var x1 = 0.0
var x2 = 0.0
var D  = 0.0
var sqD = 0.0

if let a = a, let b = b, let c = c {
    D = b * b - 4 * a * c
    
    switch true {
    case D < 0:
        print("Корней нет")
    case D == 0:
        x = -b / (2 * a)
        print("x1,2 = \(x)")
    case D > 0:
        sqD = sqrt(D)
        if sqD - Double(Int(sqD)) != 0 {
            print("x1,2 = (", -b ,"±" , "\u{221A}" , D, ")/ \(2 * a))")
        } else {
            x1 = (-b + sqD) / (2 * a)
            x2 = (-b - sqD) / (2 * a)
            print("x1 =", x1)
            print("x2 =", x2)
        }
    default:
        print("Try again")
    }
}

//Задание №2

print("Задача про прямоугольный треугольник")
print("Введите длину первого катета:")
let catet1Str = readLine()
let catet1 = Double(catet1Str ?? "")
print("Введите длину второго катета:")
let catet2Str = readLine()
let catet2 = Double(catet2Str ?? "")

if let catet1 = catet1, let catet2 = catet2 {
let area = 0.5 * catet1 * catet2
    let hypot = sqrt(pow(catet1, 2) + pow(catet2, 2))
    let perimeter = catet1 + catet2 + hypot
print("Площадь треугольника равна: \(area), длина гипотенузы равна: \(hypot), периметр равен: \(perimeter)")
}

//Задание №3

print("Расчет суммы вклада")
print("Введите сумму вклада:")
let sumStr = readLine()
let sum = Double(sumStr ?? "")
print("Введите процент:")
let percentStr = readLine()
let percent = Double(percentStr ?? "")
print("Введите срок вклада в годах:")
let yearStr = readLine()
let year = Double(yearStr ?? "")

if let sum = sum, let percent = percent, let year = year {
    let hardPercent = sum * pow((1 + percent / 100), year)
    print("Cумма в конце срока равна: \(hardPercent)")
}

