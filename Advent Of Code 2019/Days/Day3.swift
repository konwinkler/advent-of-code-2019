//
//  Day3.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/4/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

class Day3 {
    
    func closestCrossing(_ firstWirePath: [String], _ secondWirePath: [String]) -> Int {
        // parse paths
        var firstPath: Set<Point> = []
        var start = Point(0, 0)
        for pathValue in firstWirePath {
            let newPoints = self.path(from: start, along: pathValue)
            firstPath.formUnion(newPoints)
            start = newPoints.last ?? Point(0, 0)
        }
        
        var secondPath: Set<Point> = []
        start = Point(0, 0)
        for pathValue in secondWirePath {
            let newPoints = self.path(from: start, along: pathValue)
            secondPath.formUnion(newPoints)
            start = newPoints.last ?? Point(0, 0)
        }
        
        // find all intersections
        let intersections = firstPath.intersection(secondPath)
        
        // return intersection with shortest manhattan distance
        var intersationDistances = intersections.map({
            $0.manhatten
        })
        
        intersationDistances.sort(by: <)
        
        return intersationDistances.first ?? 0
    }
    
    func path(from start: Point, along path: String) -> [Point] {
        var result: [Point] = []
        var x = start.x
        var y = start.y
        
        
        let direction = Direction.init(rawValue: String(path.prefix(1))) ?? Direction.up
        
        let length: Int = Int(String(path.suffix(path.count - 1))) ?? 0
        
        for _ in 1 ... length {
            x += direction.x
            y += direction.y
            result.append(Point(x, y))
        }
        
        return result
    }
    
}

enum Direction: String {
    case up = "U"
    case down = "D"
    case left = "L"
    case right = "R"
    
    var x: Int {
        switch self {
        case .left:
            return -1
        case .right:
            return 1
        default:
            return 0
        }
    }
    
    var y: Int {
        switch self {
        case .down:
            return -1
        case .up:
            return 1
        default:
            return 0
        }
    }
}

struct Point: Hashable {
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    var manhatten: Int {
        return abs(self.x) + abs(self.y)
    }
}
