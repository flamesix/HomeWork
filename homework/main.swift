//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

enum BookingServiceErrors: Error {
    case seatUnaviable
    case notEnoughMoney
    case noSuchDestination
}

struct Flight {
    var amountOfSeats: Int
    let price: Int
    let destination: Destination
}

struct Destination {
    let name: String
    let flightNumber: Int
}

class BookingService {
    
    private var tickets = [
        "Moscow": Flight(amountOfSeats: 43, price: 2500, destination: Destination(name: "Moscow", flightNumber: 1375)),
        "Vladivostok": Flight(amountOfSeats: 350, price: 18000, destination: Destination(name: "Vladivostok", flightNumber: 1700)),
        "Novosibirsk": Flight(amountOfSeats: 1, price: 5000, destination: Destination(name: "Novosibirsk", flightNumber: 1653))
    ]
    
    public var money: Int = 0
    
    func depositMoney(amount: Int) {
        money += amount
    }
    
    func buyTicket(to destination: String) throws -> Destination? {
        
        guard let flight = tickets[destination] else { throw BookingServiceErrors.noSuchDestination}
        guard flight.amountOfSeats > 0 else { throw BookingServiceErrors.seatUnaviable}
        guard money >= flight.price else { throw BookingServiceErrors.notEnoughMoney}
        
        var newFlight = flight
        
        newFlight.amountOfSeats -= 1
        tickets[destination] = newFlight
        money -= flight.price
        
        return flight.destination
    }
}

let ticket = BookingService()
print("Money left: \(ticket.money)")
ticket.depositMoney(amount: 15000)
print("Money left: \(ticket.money)")

do {
    let firstTicket = try ticket.buyTicket(to: "Moscow")
    print("You succesfully bought ticket to destination: \(firstTicket?.name ?? ""), flight number: \(firstTicket?.flightNumber ?? 0)")
} catch {
    print(error)
}

do {
    let secondTicket = try ticket.buyTicket(to: "Novosibirsk")
    print("You succesfully bought ticket to destination: \(secondTicket?.name ?? ""), flight number: \(secondTicket?.flightNumber ?? 0)")
} catch {
    print(error)
}

do {
    let thirdTicket = try ticket.buyTicket(to: "Novosibirsk")
    print("You succesfully bought ticket to destination: \(thirdTicket?.name ?? ""), flight number: \(thirdTicket?.flightNumber ?? 0)")
} catch {
    print(error)
}

ticket.depositMoney(amount: 12000)

do {
    let forthTicket = try ticket.buyTicket(to: "Novosibirsk")
    print("You succesfully bought ticket to destination: \(forthTicket?.name ?? ""), flight number: \(forthTicket?.flightNumber ?? 0)")
} catch {
    print(error)
}

do {
    let fifthTicket = try ticket.buyTicket(to: "Novosibisrk")
    print("You succesfully bought ticket to destination: \(fifthTicket?.name ?? ""), flight number: \(fifthTicket?.flightNumber ?? 0)")
} catch {
    print(error)
}

print("Money left: \(ticket.money)")

