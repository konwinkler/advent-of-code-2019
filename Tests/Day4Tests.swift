//
//  Day4Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/6/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day4Tests: XCTestCase {

    let day = Day4()
    let input = InputDay4()
    
    func testAnswer() {
        let answer = day.countPasswords(between: input.start, and: input.end)
        XCTAssertEqual(answer, 1640)
    }
    
    func testSmallRange() {
        XCTAssertEqual(day.countPasswords(between: 111111, and: 111112), 2)
        XCTAssertEqual(day.countPasswords(between: 123779, and: 123788), 2)
    }
    
    func testIsValid() {
        XCTAssertEqual(day.isValid(password: 111111), true)
        XCTAssertEqual(day.isValid(password: 223450), false)
        XCTAssertEqual(day.isValid(password: 123789), false)
    }

}
