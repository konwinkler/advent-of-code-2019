//
//  Day5Part2Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/14/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day5Part2Tests: XCTestCase {

    let day = Day5()
    let input = InputDay5()
    
    func testAnswer() {
        let answer = day.compute(input: 5, program: input.get()).last!
        XCTAssertEqual(answer, 11430197)
    }
    
    func testLonger() {
        let intcode = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
        1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
        999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]
        XCTAssertEqual(day.compute(input: -15, program: intcode).last!, 999)
        XCTAssertEqual(day.compute(input: 0, program: intcode).last!, 999)
        XCTAssertEqual(day.compute(input: 7, program: intcode).last!, 999)
        XCTAssertEqual(day.compute(input: 8, program: intcode).last!, 1000)
        XCTAssertEqual(day.compute(input: 9, program: intcode).last!, 1001)
        XCTAssertEqual(day.compute(input: 10000, program: intcode).last!, 1001)
    }
    
    func testPosition() {
        let intcode = [3,9,8,9,10,9,4,9,99,-1,8]
        XCTAssertEqual(day.compute(input: 8, program: intcode).last!, 1)
        XCTAssertEqual(day.compute(input: 7, program: intcode).last!, 0)
    }
    
    func testLessThan() {
        let intcode = [3,9,7,9,10,9,4,9,99,-1,8]
        XCTAssertEqual(day.compute(input: 7, program: intcode).last!, 1)
        XCTAssertEqual(day.compute(input: 8, program: intcode).last!, 0)
    }
    
    func testEqualImmediate() {
        let intcode = [3,3,1108,-1,8,3,4,3,99]
        XCTAssertEqual(day.compute(input: 8, program: intcode).last!, 1)
        XCTAssertEqual(day.compute(input: 7, program: intcode).last!, 0)
    }

    func testLessThanImmediate() {
        let intcode = [3,3,1107,-1,8,3,4,3,99]
        XCTAssertEqual(day.compute(input: 7, program: intcode).last!, 1)
        XCTAssertEqual(day.compute(input: 8, program: intcode).last!, 0)
    }
    
    func testJumpPosition() {
        let intcode = [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9]
        XCTAssertEqual(day.compute(input: 0, program: intcode).last!, 0)
        XCTAssertEqual(day.compute(input: 1, program: intcode).last!, 1)
    }
    
    func testJumpImmediate() {
        let intcode = [3,3,1105,-1,9,1101,0,0,12,4,12,99,1]
        XCTAssertEqual(day.compute(input: 0, program: intcode).last!, 0)
        XCTAssertEqual(day.compute(input: 1, program: intcode).last!, 1)
    }
}
