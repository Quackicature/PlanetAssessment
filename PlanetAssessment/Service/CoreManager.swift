//
//  CoreManager.swift
//  PlanetAssessment
//
//  Created by Consultant on 12/31/19.
//  Copyright © 2019 MAC. All rights reserved.
//

//CoreManager singleton to update our Core Data

import CoreData

// Final class to stop inheritence
final class CoreManager {
    
    static let shared = CoreManager() // Globally accessible instance to share property
    
    private init(){} // Private init to only have one instance
    
    
    // Context that allows us to manipulate our objects
    var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    
    // Container that stores our core data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlanetAssessment")
        
        container.loadPersistentStores {
            (storeDescrip, err) in
            if let error = err{
                fatalError(error.localizedDescription)
            }
        }
        return container
        
    }()
    
    //MARK: Load
    func load() -> [Planet] {
        let fetch = NSFetchRequest<PlanetEntity>(entityName: "PlanetEntity") // A fetch request to retrieve data from the persistent store
        
        var planets = [Planet]() // Structure of planets to return to load
        
        //Append default list of planets
        planets.append(Planet(name: "Mercury", moons: 0))
        planets.append(Planet(name: "Earth", moons: 1))
        planets.append(Planet(name: "Neptune", moons: 13))
        planets.append(Planet(name: "Mars", moons: 2))
        planets.append(Planet(name: "Jupiter", moons: 67))
        planets.append(Planet(name: "Venus", moons: 0))
        
        
        // Try to fetch the stored planets in the core and add them to the structure to return
        do {
            let corePlanets = try context.fetch(fetch)
            
            for core in corePlanets{
                let planet = Planet(name: core.name!, moons: Int(core.moons))
                planets.append(planet)
            }
            
        } catch { // Catch an error if fetch request failed and print it
            print("Couldn't fetch planets: \(error.localizedDescription)")
        }
        
        planets = planets.filter{$0.moons < 3} // Filter list to only include planets with lest than three moons
        
        return planets // Return loaded list of planets
        
    }
    
    //MARK: Save
    func save(_ planet: Planet){
        // Create variable of entity from our data model
        guard let entity = NSEntityDescription.entity(forEntityName: "PlanetEntity", in: context) else {return}
        
        //Create an object to insert into data model
        let corePlanet = PlanetEntity(entity: entity, insertInto: context)
        
        // Add the planet to save's information into the object to save into the data model
        corePlanet.name = planet.name
        corePlanet.moons = Int64(planet.moons)
        
        // Attempt to save into data model. Catch error if presented
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
