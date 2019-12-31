//
//  ViewController.swift
//  PlanetAssessment
//
//  Created by Consultant on 12/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {
    
    @IBOutlet weak var planetTableView: UITableView!
    
    
    var planets = [Planet]() {
        didSet {
            DispatchQueue.main.async {
                self.planetTableView.reloadData()
                
            }
        }
    }
    
    var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultPlanets()
        setupTextField()
    }
    
    private func setupDefaultPlanets(){
        let mercury = Planet(name: "Mercury", moons: 0)
        let earth = Planet(name: "Earth", moons: 1)
        let neptune = Planet(name: "Neptune", moons: 13)
        let mars = Planet(name: "Mars", moons: 2)
        let jupiter = Planet(name: "Jupiter", moons: 67)
        let venus = Planet(name: "Venus", moons: 0)
        
        planets.append(mercury)
        planets.append(earth)
        planets.append(neptune)
        planets.append(mars)
        planets.append(jupiter)
        planets.append(venus)
    }
    
    private func setupTextField() {
        textField = UITextField()
        textField.placeholder = "Input planet name and moons"
        //textField.clearButtonMode = .whileEditing
        self.view.addSubview(textField)
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //TODO: Setup new planet handling; potentially use coredata
        var name: String?
        
        print("Please input your planet name: ")
        
        name = textField.text
        
        print(name)
        
//        if name is String {
//            name = readLine()
//        }
        
    }
    
    
    
    
    
}
extension PlanetViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count // Number of rows are number of planets in array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Make a cell for a planet, grab a planet from the array, and set the cell according to the planet grabbed
        let cell = tableView.dequeueReusableCell(withIdentifier: PlanetTableCell.identifier, for: indexPath) as! PlanetTableCell
        let planet = planets[indexPath.row]
        cell.mainLabel.text = "Planet: \(planet.name), Moons: \(planet.moons)"
        
        //Alternates color of rows
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.green
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let planet = planets[indexPath.row]
        
        let alertVC = storyboard?.instantiateViewController(identifier: "AlertViewController") as! AlertViewController
        
        alertVC.planet = planet
        
        
        present(alertVC, animated: true, completion: nil)
    }
    
    
}

extension PlanetViewController: UITableViewDelegate {
    
}
