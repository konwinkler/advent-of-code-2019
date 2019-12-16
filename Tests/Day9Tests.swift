//
//  Day9Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/15/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day9Tests: XCTestCase {
    
    let day = Day9()
    
    func testPointer() {
        let intcode = [1, 2, 3, 4]
        XCTAssertEqual(day.pointer(by: Day9.ParameterMode.immediate, intcode: intcode, pointer: 1, relativeBaseOffset: 1), 1)
        XCTAssertEqual(day.pointer(by: Day9.ParameterMode.position, intcode: intcode, pointer: 1, relativeBaseOffset: 1), 2)
        XCTAssertEqual(day.pointer(by: Day9.ParameterMode.relative, intcode: intcode, pointer: 1, relativeBaseOffset: 1), 3)
        let intcode2 = [1, -1]
        XCTAssertEqual(day.pointer(by: Day9.ParameterMode.relative, intcode: intcode2, pointer: 1, relativeBaseOffset: 1), 0)
    }
    
    func testSimple() {
        let intcode = [109,1,99]
        let answer = day.compute(input: [], program: intcode).last!
        XCTAssertEqual(answer, 99)
    }

    func testRelativeSimple() {
        let intcode = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
        let answer = day.compute(input: [], program: intcode)
        XCTAssertEqual(answer, intcode)
    }

}
