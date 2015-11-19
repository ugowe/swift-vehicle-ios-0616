//  Jet.swift

import Foundation

class Jet: Plane {
    
    func afterburner() {
        if speed == maxSpeed && altitude > 0 {
            speed = maxSpeed * 2
        }
    }
    
    override func climb() {
        if speed > 0 && altitude > 0 {
            altitude += maxAltitude/5
            if altitude > maxAltitude {
                altitude = maxAltitude
            }
            self.decelerate()
        }
    }
    
    override func dive() {
        if altitude > 0 {
            altitude -= maxAltitude/5
            if altitude < 0 {
                altitude = 0
            }
            self.accelerate()
        }
    }
}
