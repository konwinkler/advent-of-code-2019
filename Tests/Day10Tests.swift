//
//  Day10Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/23/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day10Tests: XCTestCase {

    let input = InputDay10()
    let day = Day10()
    
    func testSimple() {
        let answer = day.bestLocation(in: input.small.asteriodMap())
        XCTAssertEqual(answer, Location(3, 4, 8))
        
//        ▿ 3 : Location
//          - x : 1
//          - y : 2
//          - seenAsteriods : 6
        // is not correct should be 7
    }
    
    func testSmall() {
        XCTAssertEqual(day.bestLocation(in: input.second.asteriodMap()), Location(5, 8, 33))
        XCTAssertEqual(day.bestLocation(in: input.third.asteriodMap()), Location(1, 2, 35))
        XCTAssertEqual(day.bestLocation(in: input.fourth.asteriodMap()), Location(6, 3, 41))
    }
    
    func testParseMap() {
        XCTAssertEqual(day.parseMap(in: []), [])
        XCTAssertEqual(day.parseMap(in: ["."]), [])
        XCTAssertEqual(day.parseMap(in: ["#"]), [Location(0, 0)])

        let map = ["#.", ".#"]
        let expectedAnswer = [Location(0, 0), Location(1, 1)]
        XCTAssertEqual(day.parseMap(in: map), expectedAnswer)
    }
    
    func testSeenAsteriods() {
        var a = Location(0, 0)
        let b = Location(1, 1)
        a.calculateSeenAsteriods(in: [b])
        XCTAssertEqual(a.seenAsteriods, 1)
        
        a.calculateSeenAsteriods(in: [a, b])
        XCTAssertEqual(a.seenAsteriods, 1)
        
        a.calculateSeenAsteriods(in: [a, b, Location(1, 2)])
        XCTAssertEqual(a.seenAsteriods, 2)
        
        a.calculateSeenAsteriods(in: [a, b, Location(2, 2)])
        XCTAssertEqual(a.seenAsteriods, 1)
    }
    
    func testBlocked() {
        let a = Location(0, 0)
        let b = Location(1, 1)
        let c = Location(2, 2)
        let d = Location(0, 2)
        let e = Location(0, 1)

        XCTAssertFalse(a.blocked(existing: [], element: b))
        XCTAssertFalse(a.blocked(existing: [], element: c))
        XCTAssertFalse(a.blocked(existing: [d], element: b))
        XCTAssertFalse(a.blocked(existing: [d], element: c))

        XCTAssertTrue(a.blocked(existing: [b], element: c))
        XCTAssertTrue(a.blocked(existing: [d], element: e))
        XCTAssertTrue(a.blocked(existing: [b, d], element: e))
    }

}
