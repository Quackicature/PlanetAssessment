//
//  AddViewController.swift
//  PlanetAssessment
//
//  Created by Consultant on 12/31/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var planetTextField: UITextField!
    @IBOutlet weak var moonTextField: UITextField!
    
    //MARK: Properties
    var viewModel: ViewModel! //ViewModel to store
    
    //MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    @IBAction func buttonTouched(_ sender: Any) {
        
        if let planetInput = planetTextField.text, let moonInput = moonTextField.text, let moonCount = Int(moonInput){
            
            // Make sure moon count is between 0 and 3
            if planetInput.count > 0 && moonCount < 3 {
                
                //Add planet to core manager
                viewModel.addPlanet(Planet(name: planetInput, moons: moonCount))
                
                
                // Return to main view
                let planetVC = storyboard?.instantiateViewController(withIdentifier: "PlanetViewController") as! PlanetViewController
                planetVC.hidesBottomBarWhenPushed = true
                navigationController?.view.backgroundColor = .white
                present(planetVC, animated: true, completion: nil)
                
            } else {
                // Alert user their input is invalid
                let alert = UIAlertController(title: "Too many moons; need less than 3 moons", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
                present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    //MARK: Functions
    

}
