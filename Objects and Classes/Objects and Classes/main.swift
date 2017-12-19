//
//  main.swift
//  Objects and Classes
//
//  Created by Radoslav Radoev on 12/17/17.
//  Copyright © 2017 Radoslav Radoev. All rights reserved.
//

import Foundation

let myCar = Car()

let richGuysCar = Car(customerChosenColor: "Gold")

let mySelfDrivingCar = SelfDrivingCar()
mySelfDrivingCar.drive()
print(mySelfDrivingCar.color)
