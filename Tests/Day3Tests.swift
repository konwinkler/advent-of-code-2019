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
    let input = InputDay3()

    func testSample() {
        XCTAssertEqual(day.closestCrossing(["R75","D30","R83","U83","L12","D49","R71","U7","L72"], ["U62","R66","U55","R34","D71","R55","D58","R83"]), 159)
        XCTAssertEqual(day.closestCrossing(["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"], ["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]), 135)
    }
    
    func testAnswer() {
        let answer = day.closestCrossing(input.getFirst(), input.getSecond())
        XCTAssertEqual(answer, 2193)
    }
    
    func testPath() {
        let start = Point(0, 0)
        XCTAssertEqual(day.path(from: start, along: "U1"), [Point(0, 1)])
        XCTAssertEqual(day.path(from: start, along: "U2"), [Point(0, 1), Point(0, 2)])
        XCTAssertEqual(day.path(from: start, along: "D3"), [Point(0, -1), Point(0, -2), Point(0, -3)])
    }
    
    func testManhatten() {
        XCTAssertEqual(Point(0, 0).manhatten, 0)
        XCTAssertEqual(Point(0, 1).manhatten, 1)
        XCTAssertEqual(Point(3, 1).manhatten, 4)
        XCTAssertEqual(Point(-3, 1).manhatten, 4)
        XCTAssertEqual(Point(3, -4).manhatten, 7)
    }

}
