//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

enum Transmission {
    case manual, automatic, robot, variator
}

enum EngineState {
    case on, off
}

enum WindowsDoorState {
    case open, closed
}

enum Options {
    case basic, comfort, premium, sport
    
    enum Transmission {
        case manual, automatic, robot, variator
    }
}

enum SportOptions {
    case premium, luxe, sport
    
    enum Transmission {
        case automatic, robot, superGTManual
    }
}

enum TrailerType {
    case dryVan, stepDeck, refrigarator, flatbed, lowboy
}


class Car: CustomStringConvertible {
    static var numberOfCarsProduced = 0
    let brand: String
    let productionYear: Int
    var color: String
    var option: Options? {
        didSet {
            installTransmission()
        }
    }
    var transmission: Options.Transmission?
    var isEngineStarted: EngineState = .off
    var isWindowsOpened: WindowsDoorState = .closed
    var isDoorsOpened: WindowsDoorState = .closed
    
    init(brand: String, productionYear: Int, color: String) {
        self.brand = brand
        self.productionYear = productionYear
        self.color = color
        Car.numberOfCarsProduced += 1
        print(description)
    }
    
    deinit {
        print("The \(brand) and \(Car.self) is going to recycling")
        Car.numberOfCarsProduced -= 1
    }
    
    var description: String {
        if transmission == nil {
            return  "This car is going to be build soon. Please install options."
        }
        return "This is \(brand) of \(productionYear) year, in \(color) color, with \(option!) option installed, choosed transmission: \(transmission!)."
    }
    
    
    func installTransmission() {
        
        guard option != nil else {return print("Choose install option first")}
        
        switch option {
        case .basic:
            transmission = .manual
        case .comfort:
            transmission = .variator
        case .premium:
            transmission = .automatic
        case .sport:
            transmission = .robot
        case .none:
            break
        }
    }
    
    func startStopEngine() {
        
        guard option != nil else {return print("Choose install option first")}
        guard transmission != nil else {return print("Please install transmission.") }
        
        switch isEngineStarted {
        case .on:
            isEngineStarted = .off
        case .off:
            isEngineStarted = .on
        }
        
        switch isEngineStarted {
        case .on:
            print("Engine is on")
        case .off:
            print("Engine is off")
        }
    }
    
    func openCloseWindows() {
        switch isWindowsOpened {
        case .open:
            isWindowsOpened = .closed
        case .closed:
            isWindowsOpened = .open
        }
        
        switch isWindowsOpened {
        case .open:
            print("Windows are opened")
        case .closed:
            print("Windows are closed")
        }
    }
    
    func openCloseDoors() {
        switch isDoorsOpened {
        case .open:
            isDoorsOpened = .closed
        case .closed:
            isDoorsOpened = .open
        }
        
        switch isDoorsOpened {
        case .open:
            print("Doors are opened.")
        case .closed:
            print("Doors are closed.")
        }
    }
    
    func drive() {
        
        guard option != nil else {return print("Choose install option first")}
        guard transmission != nil else {return print("Please install transmission.") }
        
        if isEngineStarted == .on && isDoorsOpened == .closed {
            print("Let's go for a ride")
        } else if isEngineStarted == .on && isDoorsOpened == .open {
            print("Please close the doors and try again")
        } else {
            print("Start the engine, close the doors. And let's go.")
        }
    }
    
}

class SportCar: Car {
    
    var sportOption: SportOptions? {
        didSet {
            installTransmission()
        }
    }
    var sportTransmission: SportOptions.Transmission?
    
    override var description: String {
        if sportTransmission == nil {
            return  "This car is going to be build soon. Please install options."
        }
        return "This is \(brand) of \(productionYear) year, in \(color) color, with \(sportOption!) option installed, choosed transmission: \(sportTransmission!)."
    }
    
    override func installTransmission() {
        
        guard sportOption != nil else {return print("Choose install sport option first")}
        
        switch sportOption {
        case .premium:
            sportTransmission = .automatic
        case .luxe:
            sportTransmission = .robot
        case .sport:
            sportTransmission = .superGTManual
        case .none:
            break
            
        }
    }
    
    override func drive() {
        
        guard sportOption != nil else {return print("Choose install sport option first")}
        guard sportTransmission != nil else {return print("Please install transmission.") }
        
        if isEngineStarted == .on && isDoorsOpened == .closed {
            print("Let's go for a ride")
        } else if isEngineStarted == .on && isDoorsOpened == .open {
            print("Please close the doors and try again")
        } else {
            print("Start the engine, close the doors. And let's go.")
        }
    }
}

class Truck: Car {
    
    override var option: Options? {
        didSet {
            if option == .sport || option == .premium {
                option = .comfort
                print("Sorry, only basic or comfort are available. Option was set to comfort")
            }
        }
    }
    
    var trailer: TrailerType
    
    init(brand: String, productionYear: Int, color: String, trailer: TrailerType) {
        self.trailer = trailer
        super.init(brand: brand, productionYear: productionYear, color: color)
    }
}

let rapid = Car(brand: "Skoda", productionYear: 2020, color: "Gold")
print(rapid.description)
rapid.openCloseDoors()
rapid.option = .comfort
rapid.drive()
rapid.startStopEngine()
rapid.installTransmission()
print(rapid.description)
rapid.startStopEngine()
rapid.startStopEngine()
print(rapid.isEngineStarted)
rapid.openCloseWindows()
rapid.openCloseDoors()
rapid.drive()
rapid.startStopEngine()
rapid.drive()
rapid.openCloseDoors()
rapid.drive()
var rapidGT = rapid
print(rapidGT.description)
rapidGT.color = "Green"
print(rapidGT.description)
print(rapid.description) //изменился цвет, так как классы это reference type

let buggati = SportCar(brand: "Buggati", productionYear: 2022, color: "Red")

print(buggati.description)
print("_____________________________________\\\\")
buggati.drive()
buggati.installTransmission()
buggati.sportOption = .luxe
print("_____________________________________\\\\")
buggati.drive()
print(buggati.description)
print(Car.numberOfCarsProduced)

var kiad = Car(brand: "KIA", productionYear: 2019, color: "Blue")
var mazeratti = SportCar(brand: "Mazeratti", productionYear: 2022, color: "Yellow")
mazeratti.sportOption = .sport
print(mazeratti.description)

print("_________________________________")
let kamaz = Truck(brand: "Kamaz", productionYear: 2018, color: "Orange", trailer: .refrigarator)
kamaz.option = .basic
print(kamaz.description)
kamaz.option = .premium
kamaz.option = .basic
print(kamaz.description)
kamaz.openCloseDoors()
kamaz.openCloseWindows()
kamaz.startStopEngine()
kamaz.openCloseDoors()
kamaz.drive()

