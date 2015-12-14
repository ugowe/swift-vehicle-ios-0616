//  CarSpec.swift

import Quick
import Nimble
@testable import swift_vehicle

class CarSpec: QuickSpec {
    override func spec() {
        describe("Car") {
            
            let honda = Car(name: "Honda", weight: 2000, maxSpeed: 140, transmission: "5-speed manual", cylinders: 4, milesPerGallon: 29)
            let porsche = Car(name: "Porsche", weight: 2500, maxSpeed: 210, transmission: "6-speed manual", cylinders: 8, milesPerGallon: 18)
            
            let rollingHonda = Car(name: "Honda", weight: 2000, maxSpeed: 140, transmission: "5-speed manual", cylinders: 4, milesPerGallon: 29)
            let cruisingPorsche = Car(name: "Porsche", weight: 2500, maxSpeed: 210, transmission: "6-speed manual", cylinders: 8, milesPerGallon: 18)
            
            beforeEach {
                honda.speed = 0
                honda.heading = 0
                porsche.speed = 0
                porsche.heading = 0
                
                rollingHonda.speed = rollingHonda.maxSpeed
                rollingHonda.heading = 0
                cruisingPorsche.speed = cruisingPorsche.maxSpeed
                cruisingPorsche.heading = 0
            }
            
            describe("designated initializer") {
                it("sets properties on the superclass") {
                    expect(honda.name).to(match("Honda"))
                    expect(honda.weight).to(equal(2000))
                    expect(honda.maxSpeed).to(equal(140))
                    
                    expect(porsche.name).to(match("Porsche"))
                    expect(porsche.weight).to(equal(2500))
                    expect(porsche.maxSpeed).to(equal(210))
                }
                
                it("sets properties on the Car class") {
                    expect(honda.transmission).to(match("5-speed manual"))
                    expect(honda.cylinders).to(equal(4))
                    expect(honda.milesPerGallon).to(equal(29))
                    
                    expect(porsche.transmission).to(match("6-speed manual"))
                    expect(porsche.cylinders).to(equal(8))
                    expect(porsche.milesPerGallon).to(equal(18))
                }
                
                it("leaves the speed and heading properties at 0") {
                    let clownCar = Car(name: "clown car", weight: 1000, maxSpeed: 20, transmission: "clownual", cylinders: 2, milesPerGallon: 3.14)
                    
                    expect(clownCar.speed).to(equal(0))
                    expect(clownCar.heading).to(equal(0))
                }
            }
            
            describe("goFast") {
                it("sets speed equal to the maxSpeed") {
                    honda.goFast()
                    porsche.goFast()
                    
                    expect(honda.speed).to(equal(honda.maxSpeed))
                    expect(porsche.speed).to(equal(porsche.maxSpeed))
                }
                
                it("does not affect the heading") {
                    honda.goFast()
                    porsche.goFast()
                    
                    expect(honda.heading).to(equal(0))
                    expect(porsche.heading).to(equal(0))
                }
                
            }
            
            describe("halt") {
                it("sets speed equal to 0") {
                    rollingHonda.halt()
                    cruisingPorsche.halt()
                    
                    expect(rollingHonda.speed).to(equal(0))
                    expect(cruisingPorsche.speed).to(equal(0))
                }
                
                it("does not affect the heading") {
                    rollingHonda.halt()
                    cruisingPorsche.halt()
                    
                    expect(rollingHonda.heading).to(equal(0))
                    expect(cruisingPorsche.heading).to(equal(0))
                }
            }
            
            describe("drive") {
                it("increases the speed by 10% of the maxSpeed") {
                    honda.drive()
                    porsche.drive()
                    
                    expect(honda.speed).to(equal(honda.maxSpeed*0.1))
                    expect(porsche.speed).to(equal(porsche.maxSpeed*0.1))
                }
                
                it("increases the speed by 20% of the maxSpeed when called twice") {
                    honda.drive()
                    honda.drive()
                    porsche.drive()
                    porsche.drive()
                    
                    expect(honda.speed).to(equal(honda.maxSpeed*0.2))
                    expect(porsche.speed).to(equal(porsche.maxSpeed*0.2))
                }
                
                it("does not increase the speed beyond the maxSpeed") {
                    rollingHonda.drive()
                    cruisingPorsche.drive()
                    
                    expect(rollingHonda.speed).to(equal(rollingHonda.maxSpeed))
                    expect(cruisingPorsche.speed).to(equal(cruisingPorsche.maxSpeed))
                }
                
                it("does not affect the heading") {
                    honda.drive()
                    porsche.drive()
                    
                    expect(honda.heading).to(equal(0))
                    expect(porsche.heading).to(equal(0))
                }
            }
            
            describe("brake") {
                it("decreases the speed by 10% of the maxSpeed") {
                    rollingHonda.brake()
                    cruisingPorsche.brake()
                    
                    let hondaSpeed = rollingHonda.maxSpeed - rollingHonda.maxSpeed*0.1
                    let porscheSpeed = cruisingPorsche.maxSpeed - cruisingPorsche.maxSpeed*0.1
                    
                    expect(rollingHonda.speed).to(equal(hondaSpeed))
                    expect(cruisingPorsche.speed).to(equal(porscheSpeed))
                }
                
                it("decreases the speed by 20% of the maxSpeed when called twice") {
                    rollingHonda.brake()
                    rollingHonda.brake()
                    cruisingPorsche.brake()
                    cruisingPorsche.brake()
                    
                    let hondaSpeed = rollingHonda.maxSpeed - rollingHonda.maxSpeed*0.2
                    let porscheSpeed = cruisingPorsche.maxSpeed - cruisingPorsche.maxSpeed*0.2
                    
                    expect(rollingHonda.speed).to(equal(hondaSpeed))
                    expect(cruisingPorsche.speed).to(equal(porscheSpeed))
                    
                }
                
                it("does not decrease the speed below 0") {
                    honda.brake()
                    porsche.brake()
                    
                    expect(honda.speed).to(equal(0))
                    expect(porsche.speed).to(equal(0))
                }
                
                it("does not affect the heading") {
                    honda.brake()
                    porsche.brake()
                    
                    expect(honda.heading).to(equal(0))
                    expect(porsche.heading).to(equal(0))
                }
            }
            
            describe("turnRight") {
                it("increases the heading by 90 degrees") {
                    rollingHonda.turnRight()
                    cruisingPorsche.turnRight()
                    
                    expect(rollingHonda.heading).to(equal(90))
                    expect(cruisingPorsche.heading).to(equal(90))
                }
                
                it("increases the heading by 180 degrees when called twice") {
                    rollingHonda.turnRight()
                    rollingHonda.turnRight()
                    cruisingPorsche.turnRight()
                    cruisingPorsche.turnRight()
                    
                    expect(rollingHonda.heading).to(equal(180))
                    expect(cruisingPorsche.heading).to(equal(180))
                }
                
                it("keeps the heading between 0 and 360") {
                    rollingHonda.heading = 360
                    cruisingPorsche.heading = 360
                    
                    rollingHonda.turnRight()
                    cruisingPorsche.turnRight()
                    
                    expect(rollingHonda.heading).to(beGreaterThanOrEqualTo(0))
                    expect(rollingHonda.heading).to(beLessThan(360))
                    expect(cruisingPorsche.heading).to(beGreaterThanOrEqualTo(0))
                    expect(cruisingPorsche.heading).to(beLessThan(360))
                }
                
                it("does not affect the heading if the speed is 0") {
                    honda.turnRight()
                    porsche.turnRight()
                    
                    expect(honda.heading).to(equal(0))
                    expect(porsche.heading).to(equal(0))
                }
                
                it("decreases the speed by half when called") {
                    rollingHonda.turnRight()
                    cruisingPorsche.turnRight()
                    
                    expect(rollingHonda.speed).to(equal(rollingHonda.maxSpeed/2))
                    expect(cruisingPorsche.speed).to(equal(cruisingPorsche.maxSpeed/2))
                }
                
                it("decreases the speed by three quarters when called twice") {
                    rollingHonda.turnRight()
                    rollingHonda.turnRight()
                    cruisingPorsche.turnRight()
                    cruisingPorsche.turnRight()
                    
                    expect(rollingHonda.speed).to(equal(rollingHonda.maxSpeed/4))
                    expect(cruisingPorsche.speed).to(equal(cruisingPorsche.maxSpeed/4))
                }
            }
            
            describe("turnLeft") {
                it("keeps the heading between 0 and 360") {
                    rollingHonda.heading = 360
                    cruisingPorsche.heading = 360
                    
                    rollingHonda.turnLeft()
                    cruisingPorsche.turnLeft()
                    
                    expect(rollingHonda.heading).to(beGreaterThanOrEqualTo(0))
                    expect(rollingHonda.heading).to(beLessThan(360))
                    expect(cruisingPorsche.heading).to(beGreaterThanOrEqualTo(0))
                    expect(cruisingPorsche.heading).to(beLessThan(360))
                }
                
                it("decreases the heading by 90 degrees") {
                    rollingHonda.turnLeft()
                    cruisingPorsche.turnLeft()
                    
                    expect(rollingHonda.heading).to(equal(270))
                    expect(cruisingPorsche.heading).to(equal(270))
                }
                
                it("decreases the heading by 180 degrees when called twice") {
                    rollingHonda.turnLeft()
                    rollingHonda.turnLeft()
                    cruisingPorsche.turnLeft()
                    cruisingPorsche.turnLeft()
                    
                    expect(rollingHonda.heading).to(equal(180))
                    expect(cruisingPorsche.heading).to(equal(180))
                }
                
                it("does not affect the heading if the speed is 0") {
                    honda.turnLeft()
                    porsche.turnLeft()
                    
                    expect(honda.heading).to(equal(0))
                    expect(porsche.heading).to(equal(0))
                }
                
                it("decreases the speed by half when called") {
                    rollingHonda.turnLeft()
                    cruisingPorsche.turnLeft()
                    
                    expect(rollingHonda.speed).to(equal(rollingHonda.maxSpeed/2))
                    expect(cruisingPorsche.speed).to(equal(cruisingPorsche.maxSpeed/2))
                }
                
                it("decreases the speed by three quarters when called twice") {
                    rollingHonda.turnLeft()
                    rollingHonda.turnLeft()
                    cruisingPorsche.turnLeft()
                    cruisingPorsche.turnLeft()
                    
                    expect(rollingHonda.speed).to(equal(rollingHonda.maxSpeed/4))
                    expect(cruisingPorsche.speed).to(equal(cruisingPorsche.maxSpeed/4))
                }
            }
        }
    }
}

