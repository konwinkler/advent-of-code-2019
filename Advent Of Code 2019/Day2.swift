//
//  Day2.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/4/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

class Day2 {
    
    func compute(input intcode: [Int]) -> [Int] {
        var pointer = 0
        var copy = intcode
        
        while true {
            switch copy[pointer] {
            case 1:
                copy[copy[pointer + 3]] = copy[copy[pointer + 1]] + copy[copy[pointer + 2]]
            case 2:
                copy[copy[pointer + 3]] = copy[copy[pointer + 1]] * copy[copy[pointer + 2]]
            case 99:
                return copy
            default:
                return []
            }
            pointer += 4
        }
    }
    
}

