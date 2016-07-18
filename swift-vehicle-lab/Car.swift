//
//  Car.swift
//  swift-vehicle-lab
//
//  Created by Ugowe on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Car : Vehicle {
    
    let transmission: String
    let cylinders: Int
    let milesPerGallon: Double
    
    init(name: String, weight: Double, maxSpeed: Double, transmission: String, cylinders: Int, milesPerGallon: Double) {

        self.transmission = transmission
        self.cylinders = cylinders
        self.milesPerGallon = milesPerGallon
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }
    
    func drive() {
        super.accelerate()
    }
    
    func brake() {
        super.decelerate()
    }

}
