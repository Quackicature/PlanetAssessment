//
//  AlertViewController.swift
//  PlanetAssessment
//
//  Created by Consultant on 12/28/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

// Class to display a View Controller to alert the user of the planet information
class AlertViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    
    
    //MARK: Properties
    var planet: Planet!
    
    
    //MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
    }
    
    //MARK: IBActions
    
    
    //MARK: Functions
    private func setupAlert() {
        mainView.layer.cornerRadius = 25
        mainLabel.text = "\(planet.name) has \(planet.moons) moons"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        if touch.view == view {
            dismiss(animated: true, completion: nil)
        }
    }


}
