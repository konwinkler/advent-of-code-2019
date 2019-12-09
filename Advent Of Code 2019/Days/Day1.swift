//
//  Day1.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/3/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

class Day1 {
    
    func calculateFuel(for modules: [Int]) -> Int {
        let modulesMass = modules.map {
            Int(floor(Float($0) / 3) - 2)
        }
        
        return modulesMass.reduce(0, {$0 + $1})
    }
    
}
