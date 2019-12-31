//
//  Planet.swift
//  PlanetAssessment
//
//  Created by Consultant on 12/28/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

struct Planet {
    
    let name: String
    let moons: Int
    
    init (name: String!, moons: Int!){
        self.name = name
        self.moons = moons
    }
    
    
}


struct DefaultList {
    
    var defaultList = [Planet]()
    
    let mercury = Planet(name: "Mercury", moons: 0)
    let earth = Planet(name: "Earth", moons: 1)
    let neptune = Planet(name: "Neptune", moons: 13)
    let mars = Planet(name: "Mars", moons: 2)
    let jupiter = Planet(name: "Jupiter", moons: 67)
    let venus = Planet(name: "Venus", moons: 0)
    
    
    
    
    
}
