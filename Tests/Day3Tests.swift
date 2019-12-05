//
//  Day3Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/4/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day3Tests: XCTestCase {
    
    let day = Day3()

    func testSample() {
        XCTAssertEqual(day.closestCrossing(["R75","D30","R83","U83","L12","D49","R71","U7","L72"], ["U62","R66","U55","R34","D71","R55","D58","R83"]), 159)
    }

}
