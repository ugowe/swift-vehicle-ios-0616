//  Plane.swift

import Foundation

class Plane: Vehicle {
    let maxAltitude: Double
    var altitude: Double = 0
    var inFlight: Bool { return speed > 0 && altitude > 0 }
    
    init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }
    
    func takeoff() {
        if !inFlight {
            speed = maxSpeed/10
            altitude = maxAltitude/10
        }
    }
    
    func land() {
        speed = 0
        altitude = 0
    }
    
    func climb() {
        if inFlight {
            altitude += maxAltitude/10
            if altitude > maxAltitude {
                altitude = maxAltitude
            }
            self.decelerate()
        }
    }
    
    func dive() {
        if altitude > 0 {
            altitude -= maxAltitude/10
            if altitude < 0 {
                altitude = 0
            }
            self.accelerate()
        }
    }
    
    func bankLeft() {
        if inFlight {
            heading = (heading + 315) % 360
            speed *= 0.9
        }
    }
    
    func bankRight() {
        if inFlight {
            heading = (heading + 45) % 360
            speed *= 0.9
        }
    }
}

