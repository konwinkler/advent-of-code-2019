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
    
    func distance(_ other: Location) -> Int {
        return abs(self.x - other.x) + abs(self.y - other.y)
    }
    
    mutating func calculateSeenAsteriods(in allAsteroids: [Location]) -> () {
        // sort allAsteroids by distance to self
        let asteroids = allAsteroids.sorted(by: {
            $0.distance(self) < $1.distance(self)
        })
        
        var result = 0
        var seenAsteroids: [Location] = []
        asteroids.forEach({
            let isSelf = $0 == self
            let visible = isVisible(obstacles: seenAsteroids, element: $0)
            
            if(!isSelf && visible) {
                result += 1
                seenAsteroids.append($0)
            }
        })
        self.seenAsteriods = result
    }
    
    func isVisible(obstacles locations: [Location], element: Location) -> Bool {
        for location in locations {
            let isBetween = isPointBetweenPoints(location, self, element)
            if(isBetween) {
                return false
            }
        }
        return true
    }
}

func isPointBetweenPoints(_ currPoint: Location, _ point1: Location, _ point2: Location) -> Bool {
    // https://stackoverflow.com/questions/11907947/how-to-check-if-a-point-lies-on-a-line-between-2-other-points
    let dxc = currPoint.x - point1.x;
    let dyc = currPoint.y - point1.y;

    let dxl = point2.x - point1.x;
    let dyl = point2.y - point1.y;

    let cross = dxc * dyl - dyc * dxl;
    
    if (cross != 0) {
        return false
    }
    
    if (abs(dxl) >= abs(dyl)) {
      return dxl > 0 ?
        point1.x <= currPoint.x && currPoint.x <= point2.x :
        point2.x <= currPoint.x && currPoint.x <= point1.x
    } else {
      return dyl > 0 ?
        point1.y <= currPoint.y && currPoint.y <= point2.y :
        point2.y <= currPoint.y && currPoint.y <= point1.y
    }
}
