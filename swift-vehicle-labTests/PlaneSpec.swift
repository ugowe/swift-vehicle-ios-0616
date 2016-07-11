//  PlaneSpec.swift

import Quick
import Nimble
@testable import swift_vehicle_lab

class PlaneSpec: QuickSpec {
    override func spec() {
        describe("Plane") {
            
            // test data found on Wikipedia
            
            let cessna172 = Plane(name: "Cessna 172", weight: 2550, maxSpeed: 188, maxAltitude: 13500)
            let p51Mustang = Plane(name: "P51 Mustang", weight: 9200, maxSpeed: 437, maxAltitude: 41900)
            
            let journeyingCessna172 = Plane(name: "Cessna 172", weight: 2550, maxSpeed: 188, maxAltitude: 13500)
            let buzzingP51Mustang = Plane(name: "P51 Mustang", weight: 9200, maxSpeed: 437, maxAltitude: 41900)
            
            beforeEach {
                cessna172.speed = 0
                cessna172.altitude = 0
                cessna172.heading = 0
                p51Mustang.speed = 0
                p51Mustang.altitude = 0
                p51Mustang.heading = 0
                
                journeyingCessna172.speed = journeyingCessna172.maxSpeed/2
                journeyingCessna172.altitude = journeyingCessna172.maxAltitude/2
                journeyingCessna172.heading = 0
                buzzingP51Mustang.speed = buzzingP51Mustang.maxSpeed/2
                buzzingP51Mustang.altitude = buzzingP51Mustang.maxAltitude/2
                buzzingP51Mustang.heading = 0
            }
            
            describe("designated initializer") {
                it("sets properties on the superclass") {
                    expect(cessna172.name).to(match("Cessna 172"))
                    expect(cessna172.weight).to(equal(2550))
                    expect(cessna172.maxSpeed).to(equal(188))
                    
                    expect(p51Mustang.name).to(match("P51 Mustang"))
                    expect(p51Mustang.weight).to(equal(9200))
                    expect(p51Mustang.maxSpeed).to(equal(437))
                }
                
                it("sets the maxAltitude property on Plane") {
                    expect(cessna172.maxAltitude).to(equal(13500))
                    
                    expect(p51Mustang.maxAltitude).to(equal(41900))
                }
                
                it("leaves the speed, heading, and altitude properties at 0") {
                    let kittyHawk = Plane(name: "Kitty Hawk", weight: 605, maxSpeed: 30, maxAltitude: 30)
                    
                    expect(kittyHawk.speed).to(equal(0))
                    expect(kittyHawk.altitude).to(equal(0))
                    expect(kittyHawk.heading).to(equal(0))
                }
            }
            
            describe("inFlight calculated property") {
                it("returns true if speed and altitude are greater than 0") {
                    expect(journeyingCessna172.inFlight).to(beTrue())
                    expect(buzzingP51Mustang.inFlight).to(beTrue())
                }
                
                it("returns false if the altitude is 0") {
                    journeyingCessna172.altitude = 0
                    buzzingP51Mustang.altitude = 0
                    
                    expect(journeyingCessna172.inFlight).to(beFalse())
                    expect(buzzingP51Mustang.inFlight).to(beFalse())
                }
                
                it("returns false if the speed is 0") {
                    journeyingCessna172.speed = 0
                    buzzingP51Mustang.speed = 0
                    
                    expect(journeyingCessna172.inFlight).to(beFalse())
                    expect(buzzingP51Mustang.inFlight).to(beFalse())
                }
            }
            
            describe("takeOff") {
                it("sets the speed to 10% of maxSpeed") {
                    cessna172.takeoff()
                    p51Mustang.takeoff()
                    
                    expect(cessna172.speed) ≈ cessna172.maxSpeed*0.1
                    expect(p51Mustang.speed) ≈ p51Mustang.maxSpeed*0.1
                }
                
                it("sets the altitude to 10% of maxAltitude") {
                    cessna172.takeoff()
                    p51Mustang.takeoff()
                    
                    expect(cessna172.altitude) ≈ cessna172.maxAltitude*0.1
                    expect(p51Mustang.altitude) ≈ p51Mustang.maxAltitude*0.1
                }
                
                it("does not affect a plane already in flight") {
                    journeyingCessna172.takeoff()
                    
                    expect(journeyingCessna172.speed) ≈ journeyingCessna172.maxSpeed/2
                    expect(journeyingCessna172.altitude) ≈ journeyingCessna172.maxAltitude/2
                }
            }
            
            describe("land") {
                it("sets the speed and altitude to 0") {
                    journeyingCessna172.land()
                    buzzingP51Mustang.land()
                    
                    expect(journeyingCessna172.speed).to(equal(0))
                    expect(journeyingCessna172.altitude).to(equal(0))
                    expect(buzzingP51Mustang.speed).to(equal(0))
                    expect(buzzingP51Mustang.altitude).to(equal(0))
                }
                
                it("does not affect the heading") {
                    journeyingCessna172.heading = 90
                    buzzingP51Mustang.heading = 90
                    
                    journeyingCessna172.land()
                    buzzingP51Mustang.land()
                    
                    expect(journeyingCessna172.heading).to(equal(90))
                    expect(buzzingP51Mustang.heading).to(equal(90))
                }
            }
            
            describe("climb") {
                it("increases the altitude by 10% of maxAltitude") {
                    journeyingCessna172.climb()
                    buzzingP51Mustang.climb()
                    
                    expect(journeyingCessna172.altitude) ≈ journeyingCessna172.maxAltitude*0.6
                    expect(buzzingP51Mustang.altitude) ≈ buzzingP51Mustang.maxAltitude*0.6
                }
                
                it("decelerates the plane") {
                    journeyingCessna172.climb()
                    buzzingP51Mustang.climb()
                    
                    expect(journeyingCessna172.speed) ≈ journeyingCessna172.maxSpeed*0.4
                    expect(buzzingP51Mustang.speed) ≈ buzzingP51Mustang.maxSpeed*0.4
                }
                
                it("does not affect the heading") {
                    journeyingCessna172.climb()
                    buzzingP51Mustang.climb()
                    
                    expect(journeyingCessna172.heading).to(equal(0))
                    expect(buzzingP51Mustang.heading).to(equal(0))
                }
                
                it("does not affect a plane that is not in flight") {
                    cessna172.climb()
                    p51Mustang.climb()
                    
                    expect(cessna172.altitude).to(equal(0))
                    expect(p51Mustang.altitude).to(equal(0))
                }
            }
            
            describe("dive") {
                it("decreases the altitude by 10% of maxAltitude") {
                    journeyingCessna172.dive()
                    buzzingP51Mustang.dive()
                    
                    expect(journeyingCessna172.altitude) ≈ journeyingCessna172.maxAltitude*0.4
                    expect(buzzingP51Mustang.altitude) ≈ buzzingP51Mustang.maxAltitude*0.4
                }
                
                it("accelerates the plane") {
                    journeyingCessna172.dive()
                    buzzingP51Mustang.dive()
                    
                    expect(journeyingCessna172.speed) ≈ journeyingCessna172.maxSpeed*0.6
                    expect(buzzingP51Mustang.speed) ≈ buzzingP51Mustang.maxSpeed*0.6
                }
                
                it("does not affect the heading") {
                    journeyingCessna172.dive()
                    buzzingP51Mustang.dive()
                    
                    expect(journeyingCessna172.heading).to(equal(0))
                    expect(buzzingP51Mustang.heading).to(equal(0))
                }
                
                it("does not affect a plane that is not in flight") {
                    cessna172.dive()
                    p51Mustang.dive()
                    
                    expect(cessna172.altitude).to(equal(0))
                    expect(p51Mustang.altitude).to(equal(0))
                }
                
                it("can be performed by a stalled plane") {
                    journeyingCessna172.speed = 0
                    buzzingP51Mustang.speed = 0
                    
                    journeyingCessna172.dive()
                    buzzingP51Mustang.dive()
                    
                    expect(journeyingCessna172.speed) ≈ journeyingCessna172.maxSpeed/10
                    expect(journeyingCessna172.altitude) ≈ journeyingCessna172.maxAltitude*0.4
                    
                    expect(buzzingP51Mustang.speed) ≈ buzzingP51Mustang.maxSpeed/10
                    expect(buzzingP51Mustang.altitude) ≈ buzzingP51Mustang.maxAltitude*0.4
                }
            }
            
            describe("bankRight") {
                it("increases the heading by 45 degrees") {
                    journeyingCessna172.bankRight()
                    buzzingP51Mustang.bankRight()
                    
                    expect(journeyingCessna172.heading).to(equal(45))
                    expect(buzzingP51Mustang.heading).to(equal(45))
                }
                
                it("increases the heading by 90 degrees when called twice") {
                    journeyingCessna172.bankRight()
                    journeyingCessna172.bankRight()
                    buzzingP51Mustang.bankRight()
                    buzzingP51Mustang.bankRight()
                    
                    expect(journeyingCessna172.heading).to(equal(90))
                    expect(buzzingP51Mustang.heading).to(equal(90))
                }
                
                it("keeps the heading between 0 and 360") {
                    journeyingCessna172.heading = 360
                    buzzingP51Mustang.heading = 360
                    
                    journeyingCessna172.bankRight()
                    buzzingP51Mustang.bankRight()
                    
                    expect(journeyingCessna172.heading).to(beGreaterThanOrEqualTo(0))
                    expect(journeyingCessna172.heading).to(beLessThan(360))
                    expect(buzzingP51Mustang.heading).to(beGreaterThanOrEqualTo(0))
                    expect(buzzingP51Mustang.heading).to(beLessThan(360))
                }
                
                it("does not affect the heading if the plane is not in flight") {
                    cessna172.bankRight()
                    p51Mustang.bankRight()
                    
                    expect(cessna172.heading).to(equal(0))
                    expect(p51Mustang.heading).to(equal(0))
                }
                
                it("decreases the speed by 10% when called") {
                    journeyingCessna172.bankRight()
                    buzzingP51Mustang.bankRight()
                    
                    expect(journeyingCessna172.speed) ≈ (journeyingCessna172.maxSpeed/2)*0.9
                    expect(buzzingP51Mustang.speed) ≈ (buzzingP51Mustang.maxSpeed/2)*0.9
                }
                
                it("decreases the speed by 19% when called twice") {
                    journeyingCessna172.bankRight()
                    journeyingCessna172.bankRight()
                    buzzingP51Mustang.bankRight()
                    buzzingP51Mustang.bankRight()
                    
                    expect(journeyingCessna172.speed) ≈ (journeyingCessna172.maxSpeed/2)*0.81
                    expect(buzzingP51Mustang.speed) ≈ (buzzingP51Mustang.maxSpeed/2)*0.81
                }
            }
            
            describe("bankLeft") {
                it("keeps the heading between 0 and 360") {
                    journeyingCessna172.heading = 360
                    buzzingP51Mustang.heading = 360
                    
                    journeyingCessna172.bankLeft()
                    buzzingP51Mustang.bankLeft()
                    
                    expect(journeyingCessna172.heading).to(beGreaterThanOrEqualTo(0))
                    expect(journeyingCessna172.heading).to(beLessThan(360))
                    expect(buzzingP51Mustang.heading).to(beGreaterThanOrEqualTo(0))
                    expect(buzzingP51Mustang.heading).to(beLessThan(360))
                }
                
                it("decreases the heading by 45 degrees") {
                    journeyingCessna172.bankLeft()
                    buzzingP51Mustang.bankLeft()
                    
                    expect(journeyingCessna172.heading).to(equal(315))
                    expect(buzzingP51Mustang.heading).to(equal(315))
                }
                
                it("decreases the heading by 90 degrees when called twice") {
                    journeyingCessna172.bankLeft()
                    journeyingCessna172.bankLeft()
                    buzzingP51Mustang.bankLeft()
                    buzzingP51Mustang.bankLeft()
                    
                    expect(journeyingCessna172.heading).to(equal(270))
                    expect(buzzingP51Mustang.heading).to(equal(270))
                }
                
                it("does not affect the heading if the plane is not in flight") {
                    cessna172.bankLeft()
                    p51Mustang.bankLeft()
                    
                    expect(cessna172.heading).to(equal(0))
                    expect(p51Mustang.heading).to(equal(0))
                }
                
                it("decreases the speed by one tenth when called") {
                    journeyingCessna172.bankLeft()
                    buzzingP51Mustang.bankLeft()
                    
                    expect(journeyingCessna172.speed) ≈ (journeyingCessna172.maxSpeed/2)*0.9
                    expect(buzzingP51Mustang.speed) ≈ (buzzingP51Mustang.maxSpeed/2)*0.9
                }
                
                it("decreases the speed by 19% when called twice") {
                    journeyingCessna172.bankLeft()
                    journeyingCessna172.bankLeft()
                    buzzingP51Mustang.bankLeft()
                    buzzingP51Mustang.bankLeft()
                    
                    expect(journeyingCessna172.speed) ≈ (journeyingCessna172.maxSpeed/2)*0.81
                    expect(buzzingP51Mustang.speed) ≈ (buzzingP51Mustang.maxSpeed/2)*0.81
                }
            }
        }
    }
}
