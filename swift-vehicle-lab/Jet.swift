//
//  Jet.swift
//  swift-vehicle-lab
//
//  Created by Ugowe on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Jet : Plane {
    
    
    override func climb() {
        if inFlight == true {
            altitude += (maxAltitude * 0.20)
            decelerate()
            if altitude > maxAltitude {
                altitude = maxAltitude
            }
        }
    }
    
    override func dive() {
        if inFlight == true {
            altitude -= (maxAltitude * 0.20)
            accelerate()
            if altitude < 0 {
                altitude = maxAltitude
            }
        }
    }
    
    func afterburner() {
        if inFlight == true && speed == maxSpeed {
            speed = (maxSpeed * 2)
        }
    }
}