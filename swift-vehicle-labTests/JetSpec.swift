//  JetSpec.swift

import Quick
import Nimble
@testable import swift_vehicle_lab

class JetSpec: QuickSpec {
    override func spec() {
        describe("Jet") {
            
            // test data found on Wikipedia
            
            let f16Falcon = Jet(name: "F-16 Fighting Falcon", weight: 26500, maxSpeed: 761, maxAltitude: 50000)
            let sr71Blackbird = Jet(name: "SR-71 Blackbird", weight: 152000, maxSpeed: 1266, maxAltitude: 85000)
            
            let fightingF16Falcon = Jet(name: "F-16 Fighting Falcon", weight: 26500, maxSpeed: 761, maxAltitude: 50000)
            let screechingSR71Blackbird = Jet(name: "SR-71 Blackbird", weight: 152000, maxSpeed: 1266, maxAltitude: 85000)
            
            beforeEach {
                f16Falcon.speed = 0
                f16Falcon.altitude = 0
                f16Falcon.heading = 0
                sr71Blackbird.speed = 0
                sr71Blackbird.altitude = 0
                sr71Blackbird.heading = 0
                
                fightingF16Falcon.speed = fightingF16Falcon.maxSpeed/2
                fightingF16Falcon.altitude = fightingF16Falcon.maxAltitude/2
                fightingF16Falcon.heading = 0
                screechingSR71Blackbird.speed = screechingSR71Blackbird.maxSpeed/2
                screechingSR71Blackbird.altitude = screechingSR71Blackbird.maxAltitude/2
                screechingSR71Blackbird.heading = 0
            }
            
            describe("designated initializer") {
                it("sets properties on the superclass") {
                    expect(f16Falcon.name).to(match("F-16 Fighting Falcon"))
                    expect(f16Falcon.weight).to(equal(26500))
                    expect(f16Falcon.maxSpeed).to(equal(761))
                    expect(f16Falcon.maxAltitude).to(equal(50000))
                    
                    expect(sr71Blackbird.name).to(match("SR-71 Blackbird"))
                    expect(sr71Blackbird.weight).to(equal(152000))
                    expect(sr71Blackbird.maxSpeed).to(equal(1266))
                    expect(sr71Blackbird.maxAltitude).to(equal(85000))
                }
                
                it("leaves the speed, altitude, and heading properties at 0") {
                    let campiniN1 = Jet(name: "Camproni Campini N1", weight: 3640, maxSpeed: 233, maxAltitude: 13300)
                    
                    expect(campiniN1.speed).to(equal(0))
                    expect(campiniN1.altitude).to(equal(0))
                    expect(campiniN1.heading).to(equal(0))
                }
            }
            
            // overridden superclass methods
            
            describe("climb") {
                it("increases the altitude by 20% of maxAltitude") {
                    fightingF16Falcon.climb()
                    screechingSR71Blackbird.climb()
                    
                    expect(fightingF16Falcon.altitude) ≈ fightingF16Falcon.maxAltitude*0.7
                    expect(screechingSR71Blackbird.altitude) ≈ screechingSR71Blackbird.maxAltitude*0.7
                }
                
                it("decelerates the plane") {
                    fightingF16Falcon.climb()
                    screechingSR71Blackbird.climb()
                    
                    expect(fightingF16Falcon.speed) ≈ fightingF16Falcon.maxSpeed*0.4
                    expect(screechingSR71Blackbird.speed) ≈ screechingSR71Blackbird.maxSpeed*0.4
                }
                
                it("does not affect the heading") {
                    fightingF16Falcon.climb()
                    screechingSR71Blackbird.climb()
                    
                    expect(fightingF16Falcon.heading).to(equal(0))
                    expect(screechingSR71Blackbird.heading).to(equal(0))
                }
                
                it("does not affect a plane that is not in flight") {
                    f16Falcon.climb()
                    sr71Blackbird.climb()
                    
                    expect(f16Falcon.altitude).to(equal(0))
                    expect(sr71Blackbird.altitude).to(equal(0))
                }
            }
            
            describe("dive") {
                it("decreases the altitude by 20% of maxAltitude") {
                    fightingF16Falcon.dive()
                    screechingSR71Blackbird.dive()
                    
                    expect(fightingF16Falcon.altitude) ≈ fightingF16Falcon.maxAltitude*0.3
                    expect(screechingSR71Blackbird.altitude) ≈ screechingSR71Blackbird.maxAltitude*0.3
                }
                
                it("accelerates the plane") {
                    fightingF16Falcon.dive()
                    screechingSR71Blackbird.dive()
                    
                    expect(fightingF16Falcon.speed) ≈ fightingF16Falcon.maxSpeed*0.6
                    expect(screechingSR71Blackbird.speed) ≈ screechingSR71Blackbird.maxSpeed*0.6
                }
                
                it("does not affect the heading") {
                    fightingF16Falcon.dive()
                    screechingSR71Blackbird.dive()
                    
                    expect(fightingF16Falcon.heading).to(equal(0))
                    expect(screechingSR71Blackbird.heading).to(equal(0))
                }
                
                it("does not affect a plane that is not in flight") {
                    f16Falcon.dive()
                    sr71Blackbird.dive()
                    
                    expect(f16Falcon.altitude).to(equal(0))
                    expect(sr71Blackbird.altitude).to(equal(0))
                }
            }
            
            // new Jet method
            
            describe("afterburner") {
                it("sets speed to twice the maxSpeed") {
                    fightingF16Falcon.speed = fightingF16Falcon.maxSpeed
                    screechingSR71Blackbird.speed = screechingSR71Blackbird.maxSpeed
                    
                    fightingF16Falcon.afterburner()
                    screechingSR71Blackbird.afterburner()
                    
                    expect(fightingF16Falcon.speed) ≈ fightingF16Falcon.maxSpeed*2
                    expect(screechingSR71Blackbird.speed) ≈ screechingSR71Blackbird.maxSpeed*2
                }
                
                it("does not affect the heading") {
                    fightingF16Falcon.speed = fightingF16Falcon.maxSpeed
                    screechingSR71Blackbird.speed = screechingSR71Blackbird.maxSpeed
                    
                    fightingF16Falcon.afterburner()
                    screechingSR71Blackbird.afterburner()
                    
                    expect(fightingF16Falcon.heading).to(equal(0))
                    expect(screechingSR71Blackbird.heading).to(equal(0))
                }
                
                it("does not affect a jet that is not travelling at maxSpeed") {
                    fightingF16Falcon.afterburner()
                    screechingSR71Blackbird.afterburner()
                    
                    expect(fightingF16Falcon.speed).to(equal(fightingF16Falcon.maxSpeed/2))
                    expect(screechingSR71Blackbird.speed).to(equal(screechingSR71Blackbird.maxSpeed/2))
                }
                
                it("does not affect a jet that is not in flight") {
                    f16Falcon.afterburner()
                    sr71Blackbird.afterburner()
                    
                    expect(f16Falcon.speed).to(equal(0))
                    expect(sr71Blackbird.speed).to(equal(0))
                }
            }
        }
    }
}

