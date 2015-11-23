//  RaceCarSpec.swift

import Quick
import Nimble
@testable import swift_vehicle

class RaceCarSpec: QuickSpec {
    override func spec() {
        describe("RaceCar") {
            
            // test data found on Wikipedia
            
            let formula1 = RaceCar(name: "Formula One", weight: 1548, maxSpeed: 257, transmission: "8-speed manual", cylinders: 8, milesPerGallon: 3.1, driver: "Lewis Hamilton", sponsors: ["Mercedes"])
            let cupSeries = RaceCar(name: "Cup Series", weight: 3450, maxSpeed: 244, transmission: "4-speed manual", cylinders: 8, milesPerGallon: 3.5, driver: "Richard Petty", sponsors: ["STP", "General Mills", "Hot Wheels", "Sprint", "Georgia Pacific", "Wells Fargo", "Marathon", "Coca Cola", "Tire Kingdom", "Schwans"])
            
            let speedingFormula1 = RaceCar(name: "Formula One", weight: 1548, maxSpeed: 257, transmission: "8-speed manual", cylinders: 8, milesPerGallon: 3.1, driver: "Lewis Hamilton", sponsors: ["Mercedes"])
            let competingCupSeries = RaceCar(name: "Cup Series", weight: 3450, maxSpeed: 244, transmission: "4-speed manual", cylinders: 8, milesPerGallon: 3.5, driver: "Richard Petty", sponsors: ["STP", "General Mills", "Hot Wheels", "Sprint", "Georgia Pacific", "Wells Fargo", "Marathon", "Coca Cola", "Tire Kingdom", "Schwans"])
            
            beforeEach {
                formula1.speed = 0
                formula1.heading = 0
                cupSeries.speed = 0
                cupSeries.heading = 0
                
                speedingFormula1.speed = speedingFormula1.maxSpeed
                speedingFormula1.heading = 0
                competingCupSeries.speed = competingCupSeries.maxSpeed
                competingCupSeries.heading = 0
            }
            
            describe("designated initializer") {
                it("sets properties on superclasses") {
                    expect(formula1.name).to(match("Formula One"))
                    expect(formula1.weight).to(equal(1548))
                    expect(formula1.maxSpeed).to(equal(257))
                    expect(formula1.transmission).to(match("8-speed manual"))
                    expect(formula1.cylinders).to(equal(8))
                    expect(formula1.milesPerGallon).to(equal(3.1))
                    
                    expect(cupSeries.name).to(match("Cup Series"))
                    expect(cupSeries.weight).to(equal(3450))
                    expect(cupSeries.maxSpeed).to(equal(244))
                    expect(cupSeries.transmission).to(match("4-speed manual"))
                    expect(cupSeries.cylinders).to(equal(8))
                    expect(cupSeries.milesPerGallon).to(equal(3.5))
                }
                
                it("sets properties on RaceCar class") {
                    expect(formula1.driver).to(match("Lewis Hamilton"))
                    expect(formula1.sponsors).to(equal(["Mercedes"]))
                    
                    expect(cupSeries.driver).to(match("Richard Petty"))
                    expect(cupSeries.sponsors).to(equal(["STP", "General Mills", "Hot Wheels", "Sprint", "Georgia Pacific", "Wells Fargo", "Marathon", "Coca Cola", "Tire Kingdom", "Schwans"]))
                }
                
                it("leaves the speed and heading properties at 0") {
                    let marioKart = RaceCar(name: "Mario Kart", weight: 0, maxSpeed: 112358, transmission: "Wii-mote", cylinders: 0, milesPerGallon: 112358, driver: "Yoshi", sponsors: ["Nintendo"])
                    
                    expect(marioKart.speed).to(equal(0))
                    expect(marioKart.heading).to(equal(0))
                }
            }
            
            describe("sponsors") {
                it("should be a mutable array") {
                    formula1.sponsors.append("Vodafone")
                    
                    expect(formula1.sponsors).to(equal(["Mercedes", "Vodafone"]))
                }
            }
            
            // superclass methods
            
            describe("goFast") {
                it("sets speed equal to the maxSpeed") {
                    formula1.goFast()
                    cupSeries.goFast()
                    
                    expect(formula1.speed).to(equal(formula1.maxSpeed))
                    expect(cupSeries.speed).to(equal(cupSeries.maxSpeed))
                }
                
                it("does not affect the heading") {
                    formula1.goFast()
                    cupSeries.goFast()
                    
                    expect(formula1.heading).to(equal(0))
                    expect(cupSeries.heading).to(equal(0))
                }
            }
            
            describe("halt") {
                it("sets speed equal to 0") {
                    speedingFormula1.halt()
                    competingCupSeries.halt()
                    
                    expect(speedingFormula1.speed).to(equal(0))
                    expect(competingCupSeries.speed).to(equal(0))
                }
                
                it("does not affect the heading") {
                    speedingFormula1.halt()
                    competingCupSeries.halt()
                    
                    expect(speedingFormula1.heading).to(equal(0))
                    expect(competingCupSeries.heading).to(equal(0))
                }
            }
            
            describe("turnRight") {
                it("increases the heading by 90 degrees") {
                    speedingFormula1.turnRight()
                    competingCupSeries.turnRight()
                    
                    expect(speedingFormula1.heading).to(equal(90))
                    expect(competingCupSeries.heading).to(equal(90))
                }
                
                it("increases the heading by 180 degrees when called twice") {
                    speedingFormula1.turnRight()
                    speedingFormula1.turnRight()
                    competingCupSeries.turnRight()
                    competingCupSeries.turnRight()
                    
                    expect(speedingFormula1.heading).to(equal(180))
                    expect(competingCupSeries.heading).to(equal(180))
                }
                
                it("keeps the heading between 0 and 360") {
                    speedingFormula1.heading = 360
                    competingCupSeries.heading = 360
                    
                    speedingFormula1.turnRight()
                    competingCupSeries.turnRight()
                    
                    expect(speedingFormula1.heading).to(beGreaterThanOrEqualTo(0))
                    expect(speedingFormula1.heading).to(beLessThan(360))
                    expect(competingCupSeries.heading).to(beGreaterThanOrEqualTo(0))
                    expect(competingCupSeries.heading).to(beLessThan(360))
                }
                
                it("does not affect the heading if the speed is 0") {
                    formula1.turnRight()
                    cupSeries.turnRight()
                    
                    expect(formula1.heading).to(equal(0))
                    expect(cupSeries.heading).to(equal(0))
                }
                
                it("decreases the speed by half when called") {
                    speedingFormula1.turnRight()
                    competingCupSeries.turnRight()
                    
                    expect(speedingFormula1.speed).to(equal(speedingFormula1.maxSpeed/2))
                    expect(competingCupSeries.speed).to(equal(competingCupSeries.maxSpeed/2))
                }
                
                it("decreases the speed by three quarters when called twice") {
                    speedingFormula1.turnRight()
                    speedingFormula1.turnRight()
                    competingCupSeries.turnRight()
                    competingCupSeries.turnRight()
                    
                    expect(speedingFormula1.speed).to(equal(speedingFormula1.maxSpeed/4))
                    expect(competingCupSeries.speed).to(equal(competingCupSeries.maxSpeed/4))
                }
            }
            
            describe("turnLeft") {
                it("keeps the heading between 0 and 360") {
                    speedingFormula1.heading = 360
                    competingCupSeries.heading = 360
                    
                    speedingFormula1.turnLeft()
                    competingCupSeries.turnLeft()
                    
                    expect(speedingFormula1.heading).to(beGreaterThanOrEqualTo(0))
                    expect(speedingFormula1.heading).to(beLessThan(360))
                    expect(competingCupSeries.heading).to(beGreaterThanOrEqualTo(0))
                    expect(competingCupSeries.heading).to(beLessThan(360))
                }
                
                it("decreases the heading by 90 degrees") {
                    speedingFormula1.turnLeft()
                    competingCupSeries.turnLeft()
                    
                    expect(speedingFormula1.heading).to(equal(270))
                    expect(competingCupSeries.heading).to(equal(270))
                }
                
                it("decreases the heading by 180 degrees when called twice") {
                    speedingFormula1.turnLeft()
                    speedingFormula1.turnLeft()
                    competingCupSeries.turnLeft()
                    competingCupSeries.turnLeft()
                    
                    expect(speedingFormula1.heading).to(equal(180))
                    expect(competingCupSeries.heading).to(equal(180))
                }
                
                it("does not affect the heading if the speed is 0") {
                    formula1.turnLeft()
                    cupSeries.turnLeft()
                    
                    expect(formula1.heading).to(equal(0))
                    expect(cupSeries.heading).to(equal(0))
                }
                
                it("decreases the speed by half when called") {
                    speedingFormula1.turnLeft()
                    competingCupSeries.turnLeft()
                    
                    expect(speedingFormula1.speed).to(equal(speedingFormula1.maxSpeed/2))
                    expect(competingCupSeries.speed).to(equal(competingCupSeries.maxSpeed/2))
                }
                
                it("decreases the speed by three quarters when called twice") {
                    speedingFormula1.turnLeft()
                    speedingFormula1.turnLeft()
                    competingCupSeries.turnLeft()
                    competingCupSeries.turnLeft()
                    
                    expect(speedingFormula1.speed).to(equal(speedingFormula1.maxSpeed/4))
                    expect(competingCupSeries.speed).to(equal(competingCupSeries.maxSpeed/4))
                }
            }

            describe("override accelerate") {
                it("increases the speed by 20% of the maxSpeed") {
                    formula1.accelerate()
                    cupSeries.accelerate()
                    
                    expect(formula1.speed) ≈ formula1.maxSpeed*0.2
                    expect(cupSeries.speed) ≈ cupSeries.maxSpeed*0.2
                }
                
                it("increases the speed by 40% of the maxSpeed when called twice") {
                    formula1.accelerate()
                    formula1.accelerate()
                    cupSeries.accelerate()
                    cupSeries.accelerate()
                    
                    expect(formula1.speed) ≈ formula1.maxSpeed*0.4
                    expect(cupSeries.speed) ≈ cupSeries.maxSpeed*0.4
                }
                
                it("does not increase the speed beyond the maxSpeed") {
                    speedingFormula1.accelerate()
                    competingCupSeries.accelerate()
                    
                    expect(speedingFormula1.speed).to(equal(speedingFormula1.maxSpeed))
                    expect(competingCupSeries.speed).to(equal(competingCupSeries.maxSpeed))
                }
                
                it("does not affect the heading") {
                    formula1.accelerate()
                    cupSeries.accelerate()
                    
                    expect(formula1.heading).to(equal(0))
                    expect(cupSeries.heading).to(equal(0))
                }
            }
            
            // RaceCar methods
            
            describe("override decelerate") {
                it("decreases the speed by 20% of the maxSpeed") {
                    speedingFormula1.decelerate()
                    competingCupSeries.decelerate()
                    
                    let formula1Speed = speedingFormula1.maxSpeed - speedingFormula1.maxSpeed*0.2
                    let cupSeriesSpeed = competingCupSeries.maxSpeed - competingCupSeries.maxSpeed*0.2
                    
                    expect(speedingFormula1.speed).to(equal(formula1Speed))
                    expect(competingCupSeries.speed).to(equal(cupSeriesSpeed))
                }
                
                it("decreases the speed by 40% of the maxSpeed when called twice") {
                    speedingFormula1.decelerate()
                    speedingFormula1.decelerate()
                    competingCupSeries.decelerate()
                    competingCupSeries.decelerate()
                    
                    let formula1Speed = speedingFormula1.maxSpeed - speedingFormula1.maxSpeed*0.4
                    let cupSeriesSpeed = competingCupSeries.maxSpeed - competingCupSeries.maxSpeed*0.4
                    
                    expect(speedingFormula1.speed).to(equal(formula1Speed))
                    expect(competingCupSeries.speed).to(equal(cupSeriesSpeed))
                }
                
                it("does not decrease the speed below 0") {
                    formula1.decelerate()
                    cupSeries.decelerate()
                    
                    expect(formula1.speed).to(equal(0))
                    expect(cupSeries.speed).to(equal(0))
                }
                
                it("does not affect the heading") {
                    formula1.decelerate()
                    cupSeries.decelerate()
                    
                    expect(formula1.heading).to(equal(0))
                    expect(cupSeries.heading).to(equal(0))
                }
            }

            describe("driftRight") {
                it("increases the heading by 90 degrees") {
                    speedingFormula1.driftRight()
                    competingCupSeries.driftRight()
                    
                    expect(speedingFormula1.heading).to(equal(90))
                    expect(competingCupSeries.heading).to(equal(90))
                }
                
                it("increases the heading by 180 degrees when called twice") {
                    speedingFormula1.driftRight()
                    speedingFormula1.driftRight()
                    competingCupSeries.driftRight()
                    competingCupSeries.driftRight()
                    
                    expect(speedingFormula1.heading).to(equal(180))
                    expect(competingCupSeries.heading).to(equal(180))
                }
                
                it("keeps the heading between 0 and 360") {
                    speedingFormula1.heading = 360
                    competingCupSeries.heading = 360
                    
                    speedingFormula1.driftRight()
                    competingCupSeries.driftRight()
                    
                    expect(speedingFormula1.heading).to(beGreaterThanOrEqualTo(0))
                    expect(speedingFormula1.heading).to(beLessThan(360))
                    expect(competingCupSeries.heading).to(beGreaterThanOrEqualTo(0))
                    expect(competingCupSeries.heading).to(beLessThan(360))
                }
                
                it("does not affect the heading if the speed is 0") {
                    formula1.driftRight()
                    cupSeries.driftRight()
                    
                    expect(formula1.heading).to(equal(0))
                    expect(cupSeries.heading).to(equal(0))
                }
                
                it("decreases the speed by one quarter when called") {
                    speedingFormula1.driftRight()
                    competingCupSeries.driftRight()
                    
                    expect(speedingFormula1.speed) ≈ speedingFormula1.maxSpeed*0.75
                    expect(competingCupSeries.speed) ≈ competingCupSeries.maxSpeed*0.75
                }
                
                it("decreases the speed by seven sixteenths when called twice") {
                    speedingFormula1.driftRight()
                    speedingFormula1.driftRight()
                    competingCupSeries.driftRight()
                    competingCupSeries.driftRight()
                    
                    expect(speedingFormula1.speed) ≈ speedingFormula1.maxSpeed*0.5625
                    expect(competingCupSeries.speed) ≈ competingCupSeries.maxSpeed*0.5625
                }
            }
            
            describe("driftLeft") {
                it("keeps the heading between 0 and 360") {
                    speedingFormula1.heading = 360
                    competingCupSeries.heading = 360
                    
                    speedingFormula1.driftLeft()
                    competingCupSeries.driftLeft()
                    
                    expect(speedingFormula1.heading).to(beGreaterThanOrEqualTo(0))
                    expect(speedingFormula1.heading).to(beLessThan(360))
                    expect(competingCupSeries.heading).to(beGreaterThanOrEqualTo(0))
                    expect(competingCupSeries.heading).to(beLessThan(360))
                }
                
                it("decreases the heading by 90 degrees") {
                    speedingFormula1.driftLeft()
                    competingCupSeries.driftLeft()
                    
                    expect(speedingFormula1.heading).to(equal(270))
                    expect(competingCupSeries.heading).to(equal(270))
                }
                
                it("decreases the heading by 180 degrees when called twice") {
                    speedingFormula1.driftLeft()
                    speedingFormula1.driftLeft()
                    competingCupSeries.driftLeft()
                    competingCupSeries.driftLeft()
                    
                    expect(speedingFormula1.heading).to(equal(180))
                    expect(competingCupSeries.heading).to(equal(180))
                }
                
                it("does not affect the heading if the speed is 0") {
                    formula1.driftLeft()
                    cupSeries.driftLeft()
                    
                    expect(formula1.heading).to(equal(0))
                    expect(cupSeries.heading).to(equal(0))
                }
                
                it("decreases the speed by one quarter when called") {
                    speedingFormula1.driftLeft()
                    competingCupSeries.driftLeft()
                    
                    expect(speedingFormula1.speed) ≈ speedingFormula1.maxSpeed*0.75
                    expect(competingCupSeries.speed) ≈ competingCupSeries.maxSpeed*0.75
                }
                
                it("decreases the speed by seven sixteenths when called twice") {
                    speedingFormula1.driftLeft()
                    speedingFormula1.driftLeft()
                    competingCupSeries.driftLeft()
                    competingCupSeries.driftLeft()
                    
                    expect(speedingFormula1.speed) ≈ speedingFormula1.maxSpeed*0.5625
                    expect(competingCupSeries.speed) ≈ competingCupSeries.maxSpeed*0.5625
                }
            }
        }
    }
}

