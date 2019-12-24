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
        
        let map = day.parseMap(in: input.small.asteriodMap())
        var location = map.first(where: {
            $0.x == 1 && $0.y == 2
        })
        location?.calculateSeenAsteriods(in: map)
        XCTAssertEqual(location?.seenAsteriods, 7)
        
        var location2 = map.first(where: {
            $0.x == 3 && $0.y == 2
        })
        location2?.calculateSeenAsteriods(in: map)
        XCTAssertEqual(location2?.seenAsteriods, 7)
    }
    
    func testSmall() {
        XCTAssertEqual(day.bestLocation(in: input.second.asteriodMap()), Location(5, 8, 33))
        XCTAssertEqual(day.bestLocation(in: input.third.asteriodMap()), Location(1, 2, 35))
        XCTAssertEqual(day.bestLocation(in: input.fourth.asteriodMap()), Location(6, 3, 41))
    }
    
    func testBigger() {
        XCTAssertEqual(day.bestLocation(in: input.bigger.asteriodMap()), Location(11, 13, 210))
    }
    
    func testAnswer() {
        let answer = day.bestLocation(in: input.final.asteriodMap())
        XCTAssertEqual(answer.seenAsteriods, 256)
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
    
    func testViewBlocked() {
        let a = Location(0, 0)
        let b = Location(1, 1)
        let c = Location(2, 2)
        let d = Location(0, 2)
        let e = Location(0, 1)

        XCTAssertTrue(a.isVisible(obstacles: [], element: b))
        XCTAssertTrue(a.isVisible(obstacles: [], element: c))
        XCTAssertTrue(a.isVisible(obstacles: [d], element: b))
        XCTAssertTrue(a.isVisible(obstacles: [d], element: c))

        XCTAssertFalse(a.isVisible(obstacles: [b], element: c))
        XCTAssertFalse(a.isVisible(obstacles: [e], element: d))
        XCTAssertFalse(a.isVisible(obstacles: [d, e], element: d))
        
        XCTAssertTrue(e.isVisible(obstacles: [a], element: d), "obstacle only blocks in 1 direction")
    }

}
