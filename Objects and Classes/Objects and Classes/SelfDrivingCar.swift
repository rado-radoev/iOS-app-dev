//
//  SelfDrivingCar.swift
//  Objects and Classes
//
//  Created by Radoslav Radoev on 12/17/17.
//  Copyright © 2017 Radoslav Radoev. All rights reserved.
//

import Foundation

class SelfDrivingCar: Car {
    var destination : String?
    
    override func drive() {
        super.drive()
        
        if let userSetDestination = destination {
            print("driving to \(userSetDestination)")
        }
        
    }
}
