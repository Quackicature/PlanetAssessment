//
//  PlanetAssessmentTests.swift
//  PlanetAssessmentTests
//
//  Created by Consultant on 12/31/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import XCTest
@testable import PlanetAssessment

class PlanetAssessmentTests: XCTestCase {

    var viewModel: ViewModel!
    
    override func setUp() {
        viewModel = ViewModel() // initialize new view model
    }

    override func tearDown() {
        viewModel = nil // de-init view model
    }
    
    func testNewPlanetName() {
        let planet = Planet(name: "Joaplanet", moons: 1)
        XCTAssert(planet.name == "Joaplanet", "Planet is not called 'Joaplanet'")
    }
    
    func testNewPlanetMoon() {
        let planet = Planet(name: "Joaplanet", moons: 1)
        XCTAssert(planet.moons == 1, "Planet does not have 1 moon")
    }
    
    func testPlanetList(){
        let planets = viewModel.planets.count
        XCTAssert(planets == 0, "View Model does not initialize with 0 planets")
    }

}
