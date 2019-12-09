//
//  Day6.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/8/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

class Day6 {
    
    func countOrbits(of orbits: [String]) -> Int {
        let planetaryObjects = collectOrbits(of: orbits)

        // sum up orbits
        return planetaryObjects.reduce(0, { $0 + $1.countOrbits() })
    }
    
    func collectOrbits(of orbits: [String]) -> Set<PlanetaryObject> {
        // set guarantees no planet is count twice
        var planetaryObjects: Set<PlanetaryObject> = []
        
        orbits.forEach( {
            let orbitPlanetNames = $0.split(separator: ")")
            var firstPlanet = PlanetaryObject(String(orbitPlanetNames[0]), orbits: nil)
            let secondPlanet = PlanetaryObject(String(orbitPlanetNames[1]), orbits: firstPlanet)

            // add first planet, set prevents overwrite
            let firstInsert = planetaryObjects.insert(firstPlanet)
            if( !firstInsert.inserted) {
                firstPlanet = firstInsert.memberAfterInsert
                secondPlanet.orbits = firstInsert.memberAfterInsert
            }

            // add second planet, if already exists update orbit
            let secondInsert = planetaryObjects.insert(secondPlanet)
            if( !secondInsert.inserted ) {
                secondInsert.memberAfterInsert.orbits = firstPlanet
            }
        })
        
        return planetaryObjects
    }
    
}


class PlanetaryObject: Hashable {
    
    let name: String
    var orbits: PlanetaryObject?
    
    func countOrbits() -> Int {
        if(orbits == nil) {
            return 0
        } else {
            return (orbits?.countOrbits() ?? 0) + 1
        }
    }
    
    init(_ name: String, orbits planet: PlanetaryObject?) {
        self.name = name
        self.orbits = planet
    }
    
    static func == (lhs: PlanetaryObject, rhs: PlanetaryObject) -> Bool {
        lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
