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



class Car: CustomStringConvertible {
    let brand: String
    let productionYear: Int
    let color: String
    var option: Options
    var transmission: Options.Transmission?
    var isEngineStarted: EngineState = .off
    var isWindowsOpened: WindowsDoorState = .closed
    var isDoorsOpened: WindowsDoorState = .closed
    
    var description: String {
        if transmission == nil {
            return  "This car is going to be build soon. Please install transmission."
        }
        return "This is \(brand) of \(productionYear) year, in \(color) color, with \(option) option installed, choosed transmission: \(transmission!)."
    }
    
    func installTransmission() {
        switch option {
        case .basic:
            transmission = .manual
        case .comfort:
            transmission = .variator
        case .premium:
            transmission = .automatic
        case .sport:
            transmission = .robot
        }
    }
    
    func startStopEngine() {
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
        if isEngineStarted == .on && isDoorsOpened == .closed {
            print("Let's go for a ride")
        } else if isEngineStarted == .on && isDoorsOpened == .open {
            print("Please close the doors and try again")
        } else {
            print("Start the engine, close the doors. And let's go.")
        }
    }
    
    init(brand: String, productionYear: Int, color: String, option: Options) {
        self.brand = brand
        self.productionYear = productionYear
        self.color = color
        self.option = option
        
    }
    
}

var rapid = Car(brand: "Skoda", productionYear: 2020, color: "Gold", option: .comfort)
print(rapid.description)
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
