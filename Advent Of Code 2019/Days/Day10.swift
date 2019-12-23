//
//  Day10.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/23/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

extension MutableCollection {
  mutating func updateEach(_ update: (inout Element) -> Void) {
    for i in indices {
      update(&self[i])
    }
  }
}

class Day10 {
    
    func bestLocation(in mapInput: [String]) -> Location {
        var map = self.parseMap(in: mapInput)
        let copy = Array(map)
        
        // calculate seen asteriods per location
        map.updateEach({
            $0.calculateSeenAsteriods(in: copy)
        })
        
        return map.max()!
    }
    
    func parseMap(in map: [String]) -> [Location] {
        var result: [Location] = []
        for (y, line) in map.enumerated() {
            for (x, character) in line.enumerated() {
                if (character == "#") {
                    result.append(Location(x, y))
                }
            }
        }
        return result
    }
    
}

struct Location: Equatable, Comparable {
    
    let x, y: Int
    var seenAsteriods: Int = 0
    
    init(_ x: Int, _ y: Int, _ seenAsteriods: Int = 0) {
        self.x = x
        self.y = y
        self.seenAsteriods = seenAsteriods
    }
    
    static func < (lhs: Location, rhs: Location) -> Bool {
        return lhs.seenAsteriods < rhs.seenAsteriods
    }
    
    mutating func calculateSeenAsteriods(in map: [Location]) -> () {
        var result = 0
        var cache: [Location] = []
        map.forEach({
            if($0 != self && !blocked(existing: cache, element: $0)) {
                result += 1
                cache.append($0)
            }
        })
        self.seenAsteriods = result
    }
    
    func blocked(existing locations: [Location], element: Location) -> Bool {
        // blocked if cross poduct is zero
        for location in locations {
            let dxc = self.x - location.x;
            let dyc = self.y - location.y;

            let dxl = element.x - location.x;
            let dyl = element.y - location.y;
            
            let cross = dxc * dyl - dyc * dxl
            if (cross == 0) {
                return true
            }
        }
        
        return false
    }
}
