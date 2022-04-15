//
//  main.swift
//  homework
//
//  Created by Юрий Гриневич on 29.03.2022.
//

import Foundation

struct Flight {
    let amountOfSeats: Int
    let price: Int
    let flightNumber: Int
    let destination: Destination
}

struct Destination {
    let name: String
}

class BookingService {
    let tickets = [
        "Moscow": Flight(amountOfSeats: 43, price: 2500, flightNumber: 1375, destination: Destination(name: "Moscow")),
        "Vladivostok": Flight(amountOfSeats: 350, price: 18000, flightNumber: 1700, destination: Destination(name: "Vladivostok")),
        "Novosibirsk": Flight(amountOfSeats: 0, price: 5000, flightNumber: 1652, destination: Destination(name: "Novosibirsk"))
    ]
}
