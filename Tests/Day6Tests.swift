//
//  Day6Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/8/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day6Tests: XCTestCase {
    
    let day = Day6()
    let input = InputDay6()
    
    func testCountOrbits() {
        let a = PlanetaryObject("A", orbits: nil)
        let b = PlanetaryObject("B", orbits: a)
        let c = PlanetaryObject("C", orbits: b)
        let d = PlanetaryObject("D", orbits: b)

        XCTAssertEqual(a.countOrbits(), 0)
        XCTAssertEqual(b.countOrbits(), 1)
        XCTAssertEqual(c.countOrbits(), 2)
        XCTAssertEqual(d.countOrbits(), 2)
    }
    
    func testCollectOrbits() {
        let a = PlanetaryObject("A", orbits: nil)
        let b = PlanetaryObject("B", orbits: a)
        let c = PlanetaryObject("C", orbits: b)
        let d = PlanetaryObject("D", orbits: c)
        XCTAssertEqual(day.collectOrbits(of: ["A)B"]), [a, b])
        XCTAssertEqual(day.collectOrbits(of: ["B)C", "A)B"]), [a, b, c])
        let result = day.collectOrbits(of: ["C)D", "B)C", "A)B"])
        XCTAssertEqual(result, [a, b, c, d])
        
        // check references
        let resultA = result.first(where: {$0 == a})!
        let resultB = result.first(where: {$0 == b})!
        let resultC = result.first(where: {$0 == c})!
        let resultD = result.first(where: {$0 == d})!
        XCTAssertEqual(resultA.orbits, nil)
        XCTAssertEqual(ObjectIdentifier(resultB.orbits!), ObjectIdentifier(resultA))
        XCTAssertEqual(ObjectIdentifier(resultC.orbits!), ObjectIdentifier(resultB))
        XCTAssertEqual(ObjectIdentifier(resultD.orbits!), ObjectIdentifier(resultC))
        
        // check orbit counts
        XCTAssertEqual(resultA.countOrbits(), 0)
        XCTAssertEqual(resultB.countOrbits(), 1)
        XCTAssertEqual(resultC.countOrbits(), 2)
        XCTAssertEqual(resultD.countOrbits(), 3)
    }
    
    func testSmallCases() {
        XCTAssertEqual(day.countOrbits(of: ["AAA)BBB"]), 1)
        XCTAssertEqual(day.countOrbits(of: ["COM)B",
                                            "B)C",
                                            "C)D"]), 6)
        XCTAssertEqual(day.countOrbits(of: ["C)D",
                                            "B)C",
                                            "COM)B"]), 6, "Order of orbits should not matter")
        XCTAssertEqual(day.countOrbits(of: ["COM)B",
                                            "B)C",
                                            "C)D",
                                            "D)E",
                                            "E)F",
                                            "B)G",
                                            "G)H",
                                            "D)I",
                                            "E)J",
                                            "J)K",
                                            "K)L"]), 42)
    }
    
    func testAnswer() {
        let answer = day.countOrbits(of: input.get())
        XCTAssertEqual(answer, 186597)
    }
    
}
