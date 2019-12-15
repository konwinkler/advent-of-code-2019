//
//  Day8Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/15/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day8Tests: XCTestCase {
    
    let day = Day8()
    let input = InputDay8()
    
    func testAnswer() {
        let answer = day.hash(image: input.raw, by: 25 * 6)
        XCTAssertEqual(answer, 1548)
    }
    
    func testChunked() {
        XCTAssertEqual([1, 2, 3, 4].chunked(into: 1), [[1], [2], [3], [4]])
        XCTAssertEqual([1, 2, 3, 4].chunked(into: 2), [[1, 2], [3, 4]])
        XCTAssertEqual([1, 2, 3, 4].chunked(into: 4), [[1, 2, 3, 4]])
    }

    func testExampleImage() {
        let input = "123456789012"
        let result = day.decode(image: input, by: 6)
        let expectedLayers = [[1,2,3,4,5,6], [7,8,9,0,1,2]]
        
        XCTAssertEqual(result, expectedLayers)
    }
    
    func testFewestZeroes() {
        XCTAssertEqual(day.fewestZeroes(in: [[1,2,3,4,5,6], [7,8,9,0,1,2]]), 0)
        XCTAssertEqual(day.fewestZeroes(in: [[1,2,3,0,0,6], [7,8,9,0,1,2]]), 1)
        XCTAssertEqual(day.fewestZeroes(in: [[1,2,0,0,5,6], [7,8,9,0,1,2], [0,0,0,2,3,4]]), 1)
    }
    
    func testCountDigits() {
        XCTAssertEqual(day.countDigits(of: [1, 2, 3, 4, 1, 1], digit: 1), 3)
        XCTAssertEqual(day.countDigits(of: [1, 2, 3, 4, 1, 1], digit: 2), 1)
        XCTAssertEqual(day.countDigits(of: [1, 2, 3, 4, 1, 1], digit: 5), 0)
    }
    
    func testExampleResult() {
        let input = "123456789012"
        let result = day.hash(image: input, by: 6)
        
        XCTAssertEqual(result, 1)
    }

}
