//
//  Plane.swift
//  swift-vehicle-lab
//
//  Created by Ugowe on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Plane : Vehicle {
    
    let maxAltitude: Double
    var altitude: Double = 0
    var inFlight: Bool {
        return speed > 0 && altitude > 0
    }
    
    init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }
    
    func takeoff() {
        if inFlight == false {
            speed = (maxSpeed * 0.10)
            altitude = (maxAltitude * 0.10)
        }
    }
    
    func land() {
        speed = 0
        altitude = 0
    }
    
    func climb() {
        if inFlight == true {
            altitude += (maxAltitude * 0.10)
            decelerate()
            if altitude > maxAltitude {
                altitude = maxAltitude
            }
        }
    }
    
    func dive() {
        if altitude > 0 {
            altitude -= (maxAltitude * 0.10)
            accelerate()
        } else if altitude < 0 {
            altitude = maxAltitude
            accelerate()
        }
        
    }
    
    func bankRight() {
        if inFlight == true {
            speed -= (speed * 0.10)
            if heading >= 315 {
                heading = 0
            } else {
                heading += 45
            }
        }
    }
    
    func bankLeft() {
        if inFlight == true {
            speed -= (speed * 0.10)
            if heading == 0 {
                heading = 360 - 45
            } else {
                heading -= 45
            }
        }
    }
    
}