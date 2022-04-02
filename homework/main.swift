//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

enum SportCarActions {
    case startEngine, stopEngine, openWindows, closeWindows
}

enum SportCarTrunkLoadUnload {
    case loadToTrunk, unloadFromTrunk
    
    enum isTrunkLoaded {
        case yes, no
    }
}

enum SportCarTrunkVolume: Int {
    case max = 400
    case medium = 250
    case small = 100
}

enum TrunkCarEngineState {
    case on, off
}

enum TrunkCarWindowsState {
    case open, closed
}

enum TrunkCarTrunkVolume: Int {
    case max = 5600
    case medium = 3800
    case small = 1200
}

struct SportCar: CustomStringConvertible {
    
    var brand: String
    var year: Int
    var color: String
    var trunkVolume: SportCarTrunkVolume = .max
    var loadedVolume: SportCarTrunkLoadUnload = .unloadFromTrunk
    var isTrunkLoaded: SportCarTrunkLoadUnload.isTrunkLoaded = .no
    var isEngineWorking: Bool = false {
        didSet {
            isEngineWorking ? print("Engine is ready to go") : print("Engine is off")
        }
    }
    var isWindowsOpen: Bool = false {
        didSet {
            isWindowsOpen ? print("Windows are opened") : print("Windows are closed")
        }
    }
    
    var description: String {
        "This is a \(brand) car, \(year) prod. year, color is \(color). You can load up to \(trunkVolume.rawValue) amount of load to trunk. Ready to go."
    }
    
    init(brand: String, year: Int, color: String, trunkVolume: SportCarTrunkVolume) {
        self.brand = brand
        self.year = year
        self.color = color
        self.trunkVolume = trunkVolume
    }
    
    init(brand: String, year: Int, color: String, trunkVolume: SportCarTrunkVolume, loadedVolume: SportCarTrunkLoadUnload, isTrunkLoaded: SportCarTrunkLoadUnload.isTrunkLoaded, isEngineWorking: Bool, isWindowsOpen: Bool) {
        self.brand = brand
        self.year = year
        self.color = color
        self.trunkVolume = trunkVolume
        self.loadedVolume = loadedVolume
        self.isTrunkLoaded = isTrunkLoaded
        self.isEngineWorking = isEngineWorking
        self.isWindowsOpen = isWindowsOpen
    }
    
    mutating func action(action: SportCarActions) {
        switch action {
        case .openWindows:
            isWindowsOpen ? print("Windows are opened") : isWindowsOpen.toggle()
        case .closeWindows:
            isWindowsOpen ? isWindowsOpen.toggle() : print("Windows are closed")
        case .startEngine:
            isEngineWorking ? print("Engine is ready to go") : isEngineWorking.toggle()
        case .stopEngine:
            isEngineWorking ? isEngineWorking.toggle() : print("Engine is off")
        }
    }
    
    mutating func loadSportCar(action: SportCarTrunkLoadUnload) {
        switch action {
        case .loadToTrunk:
            self.isTrunkLoaded = .yes
        case .unloadFromTrunk:
            self.isTrunkLoaded = .no
        }
    }
}

struct TrunkCar: CustomStringConvertible {
    
    let brand: String
    let year: Int
    let color: String
    var trunkVolume: TrunkCarTrunkVolume
    var loadedVolume: Int {
        didSet {
            if loadedVolume <= trunkVolume.rawValue {
                let remainVolume = trunkVolume.rawValue - loadedVolume
                print("Remained volume is \(remainVolume)")
            } else {
                loadedVolume = trunkVolume.rawValue
                print("Sorry, maximum volume is \(trunkVolume.rawValue)")
            }
        }
    }
    var isEngineWorking: TrunkCarEngineState {
        didSet {
            isEngineWorking == .on ? print("Engine is switched on") : print("Engine is switched off")
        }
    }
    var isWindowsOpen: TrunkCarWindowsState {
        didSet {
            isWindowsOpen == .open ? print("Wind is blowing through opened windows") : print("Windows are closed")
        }
    }
    
    var description: String {
        "This is a \(brand) truck, \(year) prod. year, color is \(color). Trunk max capacity is \(trunkVolume.rawValue). Now loaded for \(loadedVolume). Engine is \(isEngineWorking). Windows are \(isWindowsOpen)"
    }
    
    mutating func engine(action: TrunkCarEngineState) {
        switch action {
        case .on:
            self.isEngineWorking = .on
        case .off:
            self.isEngineWorking = .off
        }
    }
    
    mutating func windows(action: TrunkCarWindowsState) {
        switch action {
        case .open:
            self.isWindowsOpen = .open
        case .closed:
            self.isWindowsOpen = .closed
        }
    }
}

var trunkOne = TrunkCar(brand: "Kamaz", year: 2010, color: "Yellow", trunkVolume: .max, loadedVolume: 300, isEngineWorking: .on, isWindowsOpen: .closed)

//var sportCar = SportCar(brand: "Skoda", year: 2020, color: "Green", trunkVolume: .max, isEngineWorking: false, isWindowsOpen: false)
var sportCar = SportCar(brand: "Skoda", year: 2020, color: "Green", trunkVolume: .max)


print(trunkOne.isEngineWorking)
trunkOne.engine(action: .on)
print(trunkOne.isEngineWorking)
trunkOne.windows(action: .open)
print(trunkOne.trunkVolume.rawValue)
trunkOne.loadedVolume = 1200
print(trunkOne.description)


sportCar.action(action: .openWindows)
print(sportCar.isWindowsOpen)
sportCar.action(action: .closeWindows)
print(sportCar.isWindowsOpen)

print(sportCar.isEngineWorking)

sportCar.action(action: .startEngine)
print(sportCar.isEngineWorking)

sportCar.action(action: .stopEngine)
print(sportCar.isEngineWorking)
print(sportCar.description)

var solaris = sportCar

solaris.trunkVolume = .medium
solaris.isWindowsOpen = false
solaris.isEngineWorking = true
solaris.brand = "Hyndai"
solaris.color = "Silver"
solaris.year = 2009

print(solaris.description)
print(solaris.isEngineWorking)

var kiaRio = SportCar(brand: "KIA", year: 2022, color: "White", trunkVolume: .small, loadedVolume: .loadToTrunk, isTrunkLoaded: .yes, isEngineWorking: true, isWindowsOpen: false)

print(kiaRio.description)

print(kiaRio.isWindowsOpen)
kiaRio.isWindowsOpen = true


//По разному реализованы "булевые" значения, в одному случае через emum'ы в другом через bool. Наглядно видно, что через энумы удобнее и читабельнее в распечатках yes/no open/close  вместо true/false

