//  Jet.swift

import Foundation

// 'cuz I'm leavin', on a
class Jet: Plane {
    // don't know when I'll be back again
    
    override func climb() {
        if inFlight {
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
    
    func afterburner() {
        if speed == maxSpeed && inFlight {
            speed = maxSpeed*2
        }
    }
}
