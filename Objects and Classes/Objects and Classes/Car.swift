//
//  Car.swift
//  Objects and Classes
//
//  Created by Radoslav Radoev on 12/17/17.
//  Copyright © 2017 Radoslav Radoev. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    var color = "Black"
    var numberOfSeats = 5
    var carType = 2
    var typeOfCar : CarType = .Coupe
    
    init() { }

    convenience init(customerChosenColor : String) {
        self.init()
        color = customerChosenColor
    }
    
    func drive() {
        print("Car is moving")
    }
}
