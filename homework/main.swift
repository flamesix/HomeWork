//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

// MARK: - Enumerations

enum EngineStatus {
    case started
    case stopped
    
    var status: String {
        switch self {
        case .started:
            return "started"
        case .stopped:
            return "stopped"
        }
    }
}

enum WindowsStatus {
    case opened
    case closed
    
    var status: String {
        switch self {
        case .opened:
            return "opened"
        case .closed:
            return "closed"
        }
    }
}

enum RoofStatus {
    case opened
    case closed
    
    var status: String {
        switch self {
        case .opened:
            return "opened"
        case .closed:
            return "closed"
        }
    }
}

// MARK: - Protocols

protocol CarProtocol: CustomStringConvertible {
    
    var brandName: String { get }
    var productionYear: Int { get }
    var color: String { get }
    
    var engineStatus: EngineStatus { get set }
    var windowStatus: WindowsStatus { get set }
    
    init(brandName: String, productionYear: Int, color: String)
    
    func buildCar()
}

protocol CabrioletCarProtocol {
    
    var roofStatus: RoofStatus { get set }
    
}

// MARK: - Extensions

extension CarProtocol {
    
    var description: String {
        "\(brandName) of \(productionYear) in \(color) color."
    }
    
    func buildCar() {
        print("\(brandName) is builded and ready to go")
    }
    
    mutating func startStopEngine() {
        switch engineStatus {
        case .started:
            engineStatus = .stopped
        case .stopped:
            engineStatus = .started
        }
        print("Engine of \(brandName) is \(engineStatus.status)")
    }
    
    mutating func openCloseWindows() {
        switch windowStatus {
        case .opened:
            windowStatus = .closed
        case .closed:
            windowStatus = .opened
        }
        print("Windows of \(brandName) are \(windowStatus.status)")
    }
}

extension CabrioletCarProtocol {
    
    mutating func openCloseRoof() {
        switch roofStatus {
        case .opened:
            roofStatus = .closed
        case .closed:
            roofStatus = .opened
        }
        print("Roof is \(roofStatus.status)")
    }
}

// MARK: - SportClass

class SportCar: CarProtocol {
    
    var brandName: String
    var productionYear: Int
    var color: String
    
    var engineStatus: EngineStatus = .stopped
    var windowStatus: WindowsStatus = .closed
    
    required init(brandName: String, productionYear: Int, color: String) {
        self.brandName = brandName
        self.productionYear = productionYear
        self.color = color
    }
}

// MARK: - CabrioletCarClass

final class CabrioletCar: SportCar, CabrioletCarProtocol {
    
    var roofStatus: RoofStatus = .closed
    
}


var skoda = SportCar(brandName: "Skoda", productionYear: 2022, color: "Green")
print(skoda.description)
skoda.buildCar()
skoda.startStopEngine()
skoda.startStopEngine()
skoda.openCloseWindows()

var porsche = CabrioletCar(brandName: "Porsche", productionYear: 2020, color: "Black")
print(porsche.description)
porsche.buildCar()
porsche.startStopEngine()

var arrayOfCars: [CarProtocol] = [skoda, porsche]

for model in arrayOfCars {
    print(model.brandName)
}
