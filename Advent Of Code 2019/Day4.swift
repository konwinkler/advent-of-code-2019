//
//  Day4.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/6/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

class Day4 {
    
    func countPasswords(between start: Int, and end: Int) -> Int {
        var count = 0
        for i in start ... end {
            if( self.isValid(password: i)) {
                count += 1
            }
        }
        
        return count
    }
    
    func isValid(password: Int) -> Bool {
        let digits = password.digits
        let increasing = digits.isSorted()
        let containsDouble = digits.containsDouble()
        
        return increasing && containsDouble
    }
    
}

extension StringProtocol  {
    var digits: [Int] { compactMap{ $0.wholeNumberValue } }
}
extension LosslessStringConvertible {
    var string: String { .init(self) }
}
extension Numeric where Self: LosslessStringConvertible {
    var digits: [Int] { string.digits }
}


extension Array where Array.Element: Comparable {
    func isSorted() -> Bool {
        for i in 1..<self.count {
            if (self[i-1] > self[i]) {
                return false
            }
        }
        return true
    }
    
    func containsDouble() -> Bool {
        var compareAgainst = self[0]
        for i in 1..<self.count {
            if (compareAgainst == self[i]) {
                return true
            }
            compareAgainst = self[i]
        }
        return false
    }
}
