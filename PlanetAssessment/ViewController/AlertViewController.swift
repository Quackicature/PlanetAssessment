//
//  AlertViewController.swift
//  PlanetAssessment
//
//  Created by Consultant on 12/28/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
    }
    
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
