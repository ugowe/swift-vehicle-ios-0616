//  Plane.swift

import Foundation

class Plane: Vehicle {
    let maxAltitude: Double
    var altitude: Double = 0
    
    init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }
        
    func takeoff() {
        if speed == 0 && altitude == 0 {
            speed = maxSpeed/10
            altitude = maxAltitude/10
        }
    }
    
    func climb() {
        if speed > 0 && altitude > 0 {
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
    
    func land() {
        speed = 0
        altitude = 0
    }
    
    func bankLeft() {
        if speed > 0 && altitude > 0 {
            heading = (heading + 315) % 360
            speed *= 0.9
        }
    }
    
    func bankRight() {
        if speed > 0 && altitude > 0 {
            heading = (heading + 45) % 360
            speed *= 0.9
        }
    }
}

