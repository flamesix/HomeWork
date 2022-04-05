//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

enum Transmission {
    case manual
    case automatic
    case robot
    case variator
}

enum EngineState {
    case on
    case off
}

enum WindowsDoorState {
    case open
    case closed
}

enum Options {
    case basic
    case comfort
    case premium
    case sport
    
    enum Transmission {
        case manual
        case automatic
        case robot
        case variator
    }
}

enum SportOptions {
    case premium
    case luxe
    case sport
    
    enum Transmission {
        case automatic
        case robot
        case superGTManual
    }
}

enum TrailerType {
    case dryVan
    case stepDeck
    case refrigarator
    case flatbed
    case lowboy
}

enum TrunkVolume {
    case small
    case medium
    case large
    
    var trunkVolume: Int {
        switch self {
        case .small:
            return 1000
        case .medium:
            return 2500
        case .large:
            return 5000
        }
    }
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
        print("The \(brand) car is going to recycling")
        Car.numberOfCarsProduced -= 1
    }
    
    var description: String {
        guard let transmission = transmission else { return  "This car is going to be build soon. Please install options."}
        
        return "This is \(brand) of \(productionYear) year, in \(color) color, with \(option!) option installed, choosed transmission: \(transmission)."
    } //тут force unwrap безопасен так как если есть transmission, то option уже обязан быть
    
    
    private func installTransmission() {
        
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

final class SportCar: Car {
    
    var sportOption: SportOptions? {
        didSet {
            installTransmission()
        }
    }
    var sportTransmission: SportOptions.Transmission?
    
    override var description: String {
        guard let sportTransmission = sportTransmission else { return  "This car is going to be build soon. Please install options."}
        
        return "This is \(brand) of \(productionYear) year, in \(color) color, with \(sportOption!) option installed, choosed transmission: \(sportTransmission)."
    }
    
    private func installTransmission() {
        
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

final class Truck: Car {
    
    override var option: Options? {
        didSet {
            if option == .sport || option == .premium {
                option = .comfort
                print("Sorry, only basic or comfort are available. Option was set to comfort")
            }
        }
    }
    
    var trailer: TrailerType
    var trunkVolume: TrunkVolume
    
    override var description: String {
        guard let transmission = transmission else { return  "This car is going to be build soon. Please install options."}
        
        return "This is \(brand) of \(productionYear) year, in \(color) color, with \(option!) option installed, choosed transmission: \(transmission). Trailer type is \(trailer). Trunk volume is \(trunkVolume) = \(trunkVolume.trunkVolume) liters"
    }
    
    init(brand: String, productionYear: Int, color: String, trailer: TrailerType, trunkVolume: TrunkVolume) {
        self.trailer = trailer
        self.trunkVolume = trunkVolume
        super.init(brand: brand, productionYear: productionYear, color: color)
    }
}

let rapid = Car(brand: "Skoda", productionYear: 2020, color: "Gold")
print(rapid.description)
rapid.openCloseDoors()
rapid.option = .comfort
rapid.drive()
print("_____________________________________\\\\")
rapid.startStopEngine()
//rapid.installTransmission()
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
print(rapid.description) //изменился цвет, так как обекты класса это reference type
var prototype: Car?
prototype = Car(brand: "Secret", productionYear: 2023, color: "Ruby")
print(prototype!.description)
prototype = nil //деинициализирован и удален из памяти

let buggati = SportCar(brand: "Buggati", productionYear: 2022, color: "Red")

print(buggati.description)
print("_____________________________________\\\\")
buggati.drive()
//buggati.installTransmission()
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
let kamaz = Truck(brand: "Kamaz", productionYear: 2018, color: "Orange", trailer: .refrigarator, trunkVolume: .large)
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

