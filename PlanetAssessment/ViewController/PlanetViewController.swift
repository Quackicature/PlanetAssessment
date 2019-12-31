//
//  ViewController.swift
//  PlanetAssessment
//
//  Created by Consultant on 12/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

// Class to present and manage the planet table actions
class PlanetViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var planetTableView: UITableView! //Table view to place our planets
    
    //MARK: Properties
    let viewModel = ViewModel() //ViewModel to add/load our planets
    
    
    //MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlanets()
    }
    
    //MARK: IBActions
    // Handle the button to add a planet
    @IBAction func buttonPressed(_ sender: UIButton) {
        let addVC = storyboard?.instantiateViewController(identifier: "AddViewController") as! AddViewController
        addVC.viewModel = viewModel
        present(addVC, animated: true, completion: nil)
    }
    
    
    //MARK: Functions
    private func setupPlanets() {
        planetTableView.tableFooterView = UIView(frame: .zero)
        planetTableView.separatorStyle = .none
        viewModel.delegate = self // Set delegate
        viewModel.planets = CoreManager.shared.load() // Load planets
    }
}


extension PlanetViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.planets.count // Number of rows are number of planets in array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Make a cell for a planet, grab a planet from the array, and set the cell according to the planet grabbed
        let cell = tableView.dequeueReusableCell(withIdentifier: PlanetTableCell.identifier, for: indexPath) as! PlanetTableCell
        let planet = viewModel.planets[indexPath.row]
        cell.mainLabel.text = "Planet: \(planet.name), Moons: \(planet.moons)"
        
        //Alternates color of rows
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.green
        }
        
        return cell
    }
    
    
}

extension PlanetViewController: UITableViewDelegate {
    
    // Automatically set height according to dimensions
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    // Handle displaying alert for selected planet and deselecting row when clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let planet = viewModel.planets[indexPath.row]
        
        let alertVC = storyboard?.instantiateViewController(identifier: "AlertViewController") as! AlertViewController
        alertVC.planet = planet
    
        present(alertVC, animated: true, completion: nil)
    }
    
}

// Reload the data to display the table appropriately
extension PlanetViewController: ViewModelDelegate {
    func update() {
        DispatchQueue.main.async{
            self.planetTableView.reloadData()
        }
    }
}
