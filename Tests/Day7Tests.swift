//
//  Day7Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/11/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day7Tests: XCTestCase {
    
    let day = Day7()

    func testTargetPhases() {
        let intcode = [3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0]
        
        var output = day.compute(input: [4], program: intcode).last ?? 0
        output = day.compute(input: [3, output], program: intcode).last ?? 0
        output = day.compute(input: [2, output], program: intcode).last ?? 0
        output = day.compute(input: [1, output], program: intcode).last ?? 0
        output = day.compute(input: [0, output], program: intcode).last ?? 0

        XCTAssertEqual(output, 43210)
    }
    
    func skiptestComputePhases() {
        let intcode = [3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0]
        XCTAssertEqual(day.computePhases(with: [4, 3, 2, 1, 0], on: intcode), 43210)
        
        let intcode2 = [3,23,3,24,1002,24,10,24,1002,23,-1,23,
        101,5,23,23,1,24,23,23,4,23,99,0,0]
        XCTAssertEqual(day.computePhases(with: [0,1,2,3,4], on: intcode2), 54321)
        
        // needs to handle op code 7
        let intcode3 = [3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,
        1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0]
        XCTAssertEqual(day.computePhases(with: [1,0,4,3,2], on: intcode3), 65210)
    }

}
