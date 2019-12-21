//
//  Day9Tests.swift
//  Tests
//
//  Created by Konrad Winkler on 12/15/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import XCTest

class Day9Tests: XCTestCase {
    
    let day = Day9()
    
    func testExtendSubscript() {
        var a: [Int] = []
        a[safe: 0] = 1
        XCTAssertEqual(a, [1])

        a[safe: 2] = 3
        XCTAssertEqual(a, [1, 0, 3])

        a[safe: 2] = 5
        XCTAssertEqual(a, [1, 0, 5])
        
        a[safe: 1] = 5
        XCTAssertEqual(a, [1, 5, 5])
        
        a[safe: 4] = 5
        XCTAssertEqual(a, [1, 5, 5, 0, 5])
    }
    
    func testPointer() {
        let intcode = [1, 2, 3, 4]
        XCTAssertEqual(day.pointer(by: Day9.ParameterMode.immediate, intcode: intcode, pointer: 1, relativeBaseOffset: 1), 1)
        XCTAssertEqual(day.pointer(by: Day9.ParameterMode.position, intcode: intcode, pointer: 1, relativeBaseOffset: 1), 2)
        XCTAssertEqual(day.pointer(by: Day9.ParameterMode.relative, intcode: intcode, pointer: 1, relativeBaseOffset: 1), 3)
        let intcode2 = [1, -1]
        XCTAssertEqual(day.pointer(by: Day9.ParameterMode.relative, intcode: intcode2, pointer: 1, relativeBaseOffset: 1), 0)
    }
    
    func testSimple() {
        let intcode = [109,1,99]
        let answer = day.compute(input: [], program: intcode)
        XCTAssertEqual(answer, [109,1,99])
    }
    
    func testReadInstruction() {
        let toRead = 109
        let instruction = day.readInstruction(from: toRead)
        let expected = Day9.Instruction(opCode: .adjustRelativeBase, modeFirstParameter: .immediate, modeSecondParameter: .position, modeThirdParameter: .position)
        XCTAssertEqual(instruction, expected)
        
        let intcode = [109,1,204, -1, 99]
        let first = day.pointer(by: instruction.modeFirstParameter, intcode: intcode, pointer: 1, relativeBaseOffset: 0)
        XCTAssertEqual(first, 1)
        XCTAssertEqual(intcode[first], 1)
    }

    func testRelative() {
        let intcode = [109,1,204, -1, 99]
        let answer = day.compute(input: [], program: intcode)
        XCTAssertEqual(answer, [109,1,204, -1, 99, 109])
    }
    
    func testSimpleCases() {
        XCTAssertEqual(day.compute(input: [], program: [1, 0, 0, 3, 99]), [1, 0, 0, 2, 99])
        XCTAssertEqual(day.compute(input: [], program: [2, 0, 0, 3, 99]), [2, 0, 0, 4, 99])
        XCTAssertEqual(day.compute(input: [5], program: [3, 0, 99]), [5, 0, 99])
        XCTAssertEqual(day.compute(input: [5], program: [4, 0, 99]), [4, 0, 99, 4])
    }
    
    func testReadInstructionModes() {
        XCTAssertEqual(day.readInstruction(from: 1101), Day9.Instruction(opCode: .addition, modeFirstParameter: .immediate, modeSecondParameter: .immediate, modeThirdParameter: .position))
        XCTAssertEqual(day.readInstruction(from: 10104), Day9.Instruction(opCode: .output, modeFirstParameter: .immediate, modeSecondParameter: .position, modeThirdParameter: .immediate))
    }
    
    func testParameterModes() {
        XCTAssertEqual(day.compute(input: [], program: [1101, 2, 3, 3, 99]), [1101, 2, 3, 5, 99])
        XCTAssertEqual(day.compute(input: [], program: [1, 2, 3, 3, 99]), [1, 2, 3, 6, 99])
        XCTAssertEqual(day.compute(input: [], program: [99]), [99])
    }
    
    func testLonger() {
        let intcode = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
        1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
        999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]
        XCTAssertEqual(day.compute(input: [-15], program: intcode).last!, 999)
        XCTAssertEqual(day.compute(input: [0], program: intcode).last!, 999)
        XCTAssertEqual(day.compute(input: [7], program: intcode).last!, 999)
        XCTAssertEqual(day.compute(input: [8], program: intcode).last!, 1000)
        XCTAssertEqual(day.compute(input: [9], program: intcode).last!, 1001)
        XCTAssertEqual(day.compute(input: [10000], program: intcode).last!, 1001)
    }
    
    func testPosition() {
        let intcode = [3,9,8,9,10,9,4,9,99,-1,8]
        XCTAssertEqual(day.compute(input: [8], program: intcode).last!, 1)
        XCTAssertEqual(day.compute(input: [7], program: intcode).last!, 0)
    }
    
    func testLessThan() {
        let intcode = [3,9,7,9,10,9,4,9,99,-1,8]
        XCTAssertEqual(day.compute(input: [7], program: intcode).last!, 1)
        XCTAssertEqual(day.compute(input: [8], program: intcode).last!, 0)
    }
    
    func testEqualImmediate() {
        let intcode = [3,3,1108,-1,8,3,4,3,99]
        XCTAssertEqual(day.compute(input: [8], program: intcode).last!, 1)
        XCTAssertEqual(day.compute(input: [7], program: intcode).last!, 0)
    }

    func testLessThanImmediate() {
        let intcode = [3,3,1107,-1,8,3,4,3,99]
        XCTAssertEqual(day.compute(input: [7], program: intcode).last!, 1)
        XCTAssertEqual(day.compute(input: [8], program: intcode).last!, 0)
    }
    
    func testJumpPosition() {
        let intcode = [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9]
        XCTAssertEqual(day.compute(input: [0], program: intcode).last!, 0)
        XCTAssertEqual(day.compute(input: [1], program: intcode).last!, 1)
    }
    
    func testJumpImmediate() {
        let intcode = [3,3,1105,-1,9,1101,0,0,12,4,12,99,1]
        XCTAssertEqual(day.compute(input: [0], program: intcode).last!, 0)
        XCTAssertEqual(day.compute(input: [1], program: intcode).last!, 1)
    }

    func testRelativeSimple() {
        let intcode = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
        let answer = day.compute(input: [], program: intcode)
        XCTAssertEqual(answer, intcode)
    }

}
