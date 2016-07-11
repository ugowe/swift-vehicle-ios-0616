//  VehicleSpec.swift

import XCTest
import Quick
import Nimble
@testable import swift_vehicle_lab

class VehicleSpec: QuickSpec {
    override func spec() {
        describe("Vehicle") {
            
            let skateboard = Vehicle(name: "skateboard", weight: 7.5, maxSpeed: 20.0)
            let bicycle = Vehicle(name: "bicycle", weight: 20.0, maxSpeed: 30.0)
            
            let rollingSkateboard = Vehicle(name: "skateboard", weight: 7.5, maxSpeed: 20.0)
            let movingBicycle = Vehicle(name: "bicycle", weight: 20.0, maxSpeed: 30.0)
            
            beforeEach {
                skateboard.speed = 0
                skateboard.heading = 0
                bicycle.speed = 0
                bicycle.heading = 0
                
                rollingSkateboard.speed = rollingSkateboard.maxSpeed
                rollingSkateboard.heading = 0
                movingBicycle.speed = movingBicycle.maxSpeed
                movingBicycle.heading = 0
            }
            
            describe("designated initializer") {
                it("sets the name property") {
                    expect(skateboard.name).to(match("skateboard"))
                    expect(bicycle.name).to(match("bicycle"))
                }
                
                it("sets the weight property") {
                    expect(skateboard.weight).to(equal(7.5))
                    expect(bicycle.weight).to(equal(20.0))
                }
                
                it("sets the maxSpeed property") {
                    expect(skateboard.maxSpeed).to(equal(20.0))
                    expect(bicycle.maxSpeed).to(equal(30.0))
                }
                
                it("leaves the speed and heading properties at 0") {
                    let unicycle = Vehicle(name: "unicycle", weight: 10, maxSpeed: 10)
                    
                    expect(unicycle.speed).to(equal(0))
                    expect(unicycle.heading).to(equal(0))
                }
            }
            
            describe("goFast") {
                it("sets speed equal to the maxSpeed") {
                    skateboard.goFast()
                    bicycle.goFast()
                    
                    expect(skateboard.speed).to(equal(skateboard.maxSpeed))
                    expect(bicycle.speed).to(equal(bicycle.maxSpeed))
                }
                
                it("does not affect the heading") {
                    skateboard.goFast()
                    bicycle.goFast()
                    
                    expect(skateboard.heading).to(equal(0))
                    expect(bicycle.heading).to(equal(0))
                }
                
            }
            
            describe("halt") {
                it("sets speed equal to 0") {
                    rollingSkateboard.halt()
                    movingBicycle.halt()
                    
                    expect(rollingSkateboard.speed).to(equal(0))
                    expect(movingBicycle.speed).to(equal(0))
                }
                
                it("does not affect the heading") {
                    rollingSkateboard.halt()
                    movingBicycle.halt()
                    
                    expect(rollingSkateboard.heading).to(equal(0))
                    expect(movingBicycle.heading).to(equal(0))
                }
            }
            
            describe("accelerate") {
                it("increases the speed by 10% of the maxSpeed") {
                    skateboard.accelerate()
                    bicycle.accelerate()
                    
                    expect(skateboard.speed).to(equal(skateboard.maxSpeed*0.1))
                    expect(bicycle.speed).to(equal(bicycle.maxSpeed*0.1))
                }
                
                it("increases the speed by 20% of the maxSpeed when called twice") {
                    skateboard.accelerate()
                    skateboard.accelerate()
                    bicycle.accelerate()
                    bicycle.accelerate()
                    
                    expect(skateboard.speed).to(equal(skateboard.maxSpeed*0.2))
                    expect(bicycle.speed).to(equal(bicycle.maxSpeed*0.2))
                }
                
                it("does not increase the speed beyond the maxSpeed") {
                    rollingSkateboard.accelerate()
                    movingBicycle.accelerate()
                    
                    expect(rollingSkateboard.speed).to(equal(rollingSkateboard.maxSpeed))
                    expect(movingBicycle.speed).to(equal(movingBicycle.maxSpeed))
                }
                
                it("does not affect the heading") {
                    skateboard.accelerate()
                    bicycle.accelerate()
                    
                    expect(skateboard.heading).to(equal(0))
                    expect(bicycle.heading).to(equal(0))
                }
            }
            
            describe("decelerate") {
                it("decreases the speed by 10% of the maxSpeed") {
                    rollingSkateboard.decelerate()
                    movingBicycle.decelerate()
                    
                    let skateSpeed = rollingSkateboard.maxSpeed - rollingSkateboard.maxSpeed*0.1
                    let bikeSpeed = movingBicycle.maxSpeed - movingBicycle.maxSpeed*0.1
                    
                    expect(rollingSkateboard.speed).to(equal(skateSpeed))
                    expect(movingBicycle.speed).to(equal(bikeSpeed))
                }
                
                it("decreases the speed by 20% of the maxSpeed when called twice") {
                    rollingSkateboard.decelerate()
                    rollingSkateboard.decelerate()
                    movingBicycle.decelerate()
                    movingBicycle.decelerate()
                    
                    let skateSpeed = rollingSkateboard.maxSpeed - rollingSkateboard.maxSpeed*0.2
                    let bikeSpeed = movingBicycle.maxSpeed - movingBicycle.maxSpeed*0.2
                    
                    expect(rollingSkateboard.speed).to(equal(skateSpeed))
                    expect(movingBicycle.speed).to(equal(bikeSpeed))
                }
                
                it("does not decrease the speed below 0") {
                    skateboard.decelerate()
                    bicycle.decelerate()
                    
                    expect(skateboard.speed).to(equal(0))
                    expect(bicycle.speed).to(equal(0))
                }
                
                it("does not affect the heading") {
                    skateboard.decelerate()
                    bicycle.decelerate()
                    
                    expect(skateboard.heading).to(equal(0))
                    expect(bicycle.heading).to(equal(0))
                }
            }
            
            describe("turnRight") {
                it("increases the heading by 90 degrees") {
                    rollingSkateboard.turnRight()
                    movingBicycle.turnRight()
                    
                    expect(rollingSkateboard.heading).to(equal(90))
                    expect(movingBicycle.heading).to(equal(90))
                }
                
                it("increases the heading by 180 degrees when called twice") {
                    rollingSkateboard.turnRight()
                    rollingSkateboard.turnRight()
                    movingBicycle.turnRight()
                    movingBicycle.turnRight()
                    
                    expect(rollingSkateboard.heading).to(equal(180))
                    expect(movingBicycle.heading).to(equal(180))
                }
                
                it("keeps the heading between 0 and 360") {
                    rollingSkateboard.heading = 360
                    movingBicycle.heading = 360
                    
                    rollingSkateboard.turnRight()
                    movingBicycle.turnRight()
                    
                    expect(rollingSkateboard.heading).to(beGreaterThanOrEqualTo(0))
                    expect(rollingSkateboard.heading).to(beLessThan(360))
                    expect(movingBicycle.heading).to(beGreaterThanOrEqualTo(0))
                    expect(movingBicycle.heading).to(beLessThan(360))
                }
                
                it("does not affect the heading if the speed is 0") {
                    skateboard.turnRight()
                    bicycle.turnRight()
                    
                    expect(skateboard.heading).to(equal(0))
                    expect(bicycle.heading).to(equal(0))
                }
                
                it("decreases the speed by half when called") {
                    rollingSkateboard.turnRight()
                    movingBicycle.turnRight()
                    
                    expect(rollingSkateboard.speed).to(equal(rollingSkateboard.maxSpeed/2))
                    expect(movingBicycle.speed).to(equal(movingBicycle.maxSpeed/2))
                }
                
                it("decreases the speed by three quarters when called twice") {
                    rollingSkateboard.turnRight()
                    rollingSkateboard.turnRight()
                    movingBicycle.turnRight()
                    movingBicycle.turnRight()
                    
                    expect(rollingSkateboard.speed).to(equal(rollingSkateboard.maxSpeed/4))
                    expect(movingBicycle.speed).to(equal(movingBicycle.maxSpeed/4))
                }
            }
            
            describe("turnLeft") {
                it("keeps the heading between 0 and 360") {
                    rollingSkateboard.heading = 360
                    movingBicycle.heading = 360
                    
                    rollingSkateboard.turnLeft()
                    movingBicycle.turnLeft()
                    
                    expect(rollingSkateboard.heading).to(beGreaterThanOrEqualTo(0))
                    expect(rollingSkateboard.heading).to(beLessThan(360))
                    expect(movingBicycle.heading).to(beGreaterThanOrEqualTo(0))
                    expect(movingBicycle.heading).to(beLessThan(360))
                }
                
                it("decreases the heading by 90 degrees") {
                    rollingSkateboard.turnLeft()
                    movingBicycle.turnLeft()
                    
                    expect(rollingSkateboard.heading).to(equal(270))
                    expect(movingBicycle.heading).to(equal(270))
                }
                
                it("decreases the heading by 180 degrees when called twice") {
                    rollingSkateboard.turnLeft()
                    rollingSkateboard.turnLeft()
                    movingBicycle.turnLeft()
                    movingBicycle.turnLeft()
                    
                    expect(rollingSkateboard.heading).to(equal(180))
                    expect(movingBicycle.heading).to(equal(180))
                }
                
                it("does not affect the heading if the speed is 0") {
                    skateboard.turnLeft()
                    bicycle.turnLeft()
                    
                    expect(skateboard.heading).to(equal(0))
                    expect(bicycle.heading).to(equal(0))
                }
                
                it("decreases the speed by half when called") {
                    rollingSkateboard.turnLeft()
                    movingBicycle.turnLeft()
                    
                    expect(rollingSkateboard.speed).to(equal(rollingSkateboard.maxSpeed/2))
                    expect(movingBicycle.speed).to(equal(movingBicycle.maxSpeed/2))
                }
                
                it("decreases the speed by three quarters when called twice") {
                    rollingSkateboard.turnLeft()
                    rollingSkateboard.turnLeft()
                    movingBicycle.turnLeft()
                    movingBicycle.turnLeft()
                    
                    expect(rollingSkateboard.speed).to(equal(rollingSkateboard.maxSpeed/4))
                    expect(movingBicycle.speed).to(equal(movingBicycle.maxSpeed/4))
                }
            }
        }
    }
}

