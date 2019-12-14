//
//  Day5Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/7/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day5Tests: XCTestCase {
    
    let day = Day5()
    let input = InputDay5()

    func testSimpleCases() {
        XCTAssertEqual(day.compute(input: 0, program: [1, 0, 0, 3, 99]), [1, 0, 0, 2, 99, 0])
        XCTAssertEqual(day.compute(input: 0, program: [2, 0, 0, 3, 99]), [2, 0, 0, 4, 99, 0])
        XCTAssertEqual(day.compute(input: 5, program: [3, 0, 99]), [5, 0, 99, 0])
        XCTAssertEqual(day.compute(input: 5, program: [4, 0, 99]), [4, 0, 99, 4])
    }
    
    func testReadInstruction() {
        XCTAssertEqual(day.readInstruction(from: 1101), Day5.Instruction(opCode: .addition, modeFirstParameter: .Immediate, modeSecondParameter: .Immediate, modeThirdParameter: .Position))
        XCTAssertEqual(day.readInstruction(from: 10104), Day5.Instruction(opCode: .output, modeFirstParameter: .Immediate, modeSecondParameter: .Position, modeThirdParameter: .Immediate))
    }
    
    func testParameterModes() {
        XCTAssertEqual(day.compute(input: 0, program: [1101, 2, 3, 3, 99]), [1101, 2, 3, 5, 99, 0])
        XCTAssertEqual(day.compute(input: 0, program: [1, 2, 3, 3, 99]), [1, 2, 3, 6, 99, 0])
        XCTAssertEqual(day.compute(input: 0, program: [99]), [99, 0])        
    }
    
    func testAnswer() {
        let answer = day.compute(input: 1, program: input.get()).last!
        print(answer)
        XCTAssertEqual(answer, 15426686)
    }

}
