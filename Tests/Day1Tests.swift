//
//  Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/3/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day1Tests: XCTestCase {

    let input1 = InputDay1()
    let day1 = Day1()

    func testInput() {
        XCTAssertNotEqual(input1.getValues(), [])
    }
    
    func testModules() {
        XCTAssertEqual(day1.calculateFuel(for: [12]), 2)
        XCTAssertEqual(day1.calculateFuel(for: [14]), 2)
        XCTAssertEqual(day1.calculateFuel(for: [1969]), 654)
        XCTAssertEqual(day1.calculateFuel(for: [100756]), 33583)
    }
    
    func testAnswer() {
        let answer = day1.calculateFuel(for: input1.getValues())
        XCTAssertEqual(answer, 3497399)
    }

}
