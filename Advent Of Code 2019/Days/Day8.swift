//
//  Day8.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/15/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

class Day8 {
    
    func hash(image input: String, by layerSize: Int) -> Int {
        let layers = self.decode(image: input, by: layerSize)
        
        let layerFewestZeroes = self.fewestZeroes(in: layers)
        
        let countOneDigits = self.countDigits(of: layers[layerFewestZeroes], digit: 1)
        let countTwoDigits = self.countDigits(of: layers[layerFewestZeroes], digit: 2)
        
        return countOneDigits * countTwoDigits
    }
    
    func countDigits(of layer: [Int], digit: Int) -> Int {
        return layer.reduce(0, {
            let countIncrement = ($1 == digit) ? 1 : 0
            return $0 + countIncrement
        })
    }
    
    func fewestZeroes(in layers: [[Int]]) -> Int {
        var layerFewestZeroes = 0
        var minimumZeroCount = Int.max
        for i in 0 ..< layers.count {
            let countZeroes = self.countDigits(of: layers[i], digit: 0)
            if (countZeroes < minimumZeroCount) {
                minimumZeroCount = countZeroes
                layerFewestZeroes = i
            }
        }
        return layerFewestZeroes
    }
    
    func decode(image input: String, by layerSize: Int) -> [[Int]] {
        let imageDigits = input.map({
            Int(String($0))!
        })
        
        let result = imageDigits.chunked(into: layerSize)
        
        return result
    }
    
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
