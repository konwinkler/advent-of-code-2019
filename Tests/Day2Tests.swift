//
//  Day2Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/4/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day2Tests: XCTestCase {
    
    let day2 = Day2()
    let input = InputDay2()

    func testSmall() {
        XCTAssertEqual(day2.compute(input: [1,0,0,0,99]), [2,0,0,0,99])
        XCTAssertEqual(day2.compute(input: [2,3,0,3,99]), [2,3,0,6,99])
        XCTAssertEqual(day2.compute(input: [2,4,4,5,99,0]), [2,4,4,5,99,9801])
        XCTAssertEqual(day2.compute(input: [1,1,1,4,99,5,6,0,99]), [30,1,1,4,2,5,6,0,99])
        XCTAssertEqual(day2.compute(input: [1,9,10,3,2,3,11,0,99,30,40,50]), [3500,9,10,70,2,3,11,0,99,30,40,50])
    }
    
    func testAnswer() {
        let answer = day2.compute(input: input.getInput())
        XCTAssertEqual(answer[0], 5110675)
    }

}
