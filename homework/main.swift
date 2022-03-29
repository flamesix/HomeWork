//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation


struct SportCar {
    let brand: String
    let year: Int
    let color: String
    let trunkVolume: Int
    let isEngineWorking: Bool
    let isWindowsOpen: Bool
}

struct TrunkCar {
    let brand: String
    let year: Int
    let color: String
    let trunkVolume: Int
    let isEngineWorking: Bool
    let isWindowsOpen: Bool
}

var trunkOne = TrunkCar(brand: "Kamaz", year: 2010, color: "Yellow", trunkVolume: 5600, isEngineWorking: true, isWindowsOpen: false)


