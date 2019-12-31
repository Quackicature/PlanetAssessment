//
//  ViewModel.swift
//  PlanetAssessment
//
//  Created by Consultant on 12/31/19.
//  Copyright © 2019 MAC. All rights reserved.
//

//View Model to handle saving planets and updating the list
protocol ViewModelDelegate: class {
    func update()
}

class ViewModel {
    weak var delegate: ViewModelDelegate?
    
    var planets = [Planet]() {
        
        didSet {
            delegate?.update()
        }
    }
    
    func addPlanet(_ planet: Planet) {
        CoreManager.shared.save(planet)
    }
}
