//
//  Day9.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/15/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

extension Array where Array.Element == Int {
    
    subscript(safe index: Int) -> Int {
        get {
            return indices.contains(index) ? self[index] : 0
        }
        
        set {
            while(self.count <= index) {
                self.append(0)
            }
            self[index] = newValue
        }
    }
}

class Day9 {
    func pointer(by mode: ParameterMode, intcode: [Int], pointer: Int, relativeBaseOffset: Int) -> Int {
        switch (mode) {
        case .immediate:
            return pointer
        case .position:
            return intcode[safe: pointer] ?? 0
        case .relative:
            return relativeBaseOffset + (intcode[safe: pointer] ?? 0)
        }
    }
    
    func compute(input inputValues: [Int], program original: [Int]) -> [Int] {
        var pointer = 0
        var intcode = original
        var output: Int?
        var inputCopy = inputValues.reversed() as [Int]
        var relativeBaseOffset = 0
        
        while true {
            let instruction = self.readInstruction(from: intcode[pointer])

            let first = self.pointer(by: instruction.modeFirstParameter, intcode: intcode, pointer: pointer + 1, relativeBaseOffset: relativeBaseOffset)
            let second = self.pointer(by: instruction.modeFirstParameter, intcode: intcode, pointer: pointer + 2, relativeBaseOffset: relativeBaseOffset)
            let third = self.pointer(by: instruction.modeFirstParameter, intcode: intcode, pointer: pointer + 3, relativeBaseOffset: relativeBaseOffset)
            
            switch instruction.opCode {
            case .addition:
                intcode[safe: third] = intcode[safe: first] + intcode[safe: second]
                pointer += instruction.increment
            case .multiplication:
                intcode[safe: third] = intcode[safe: first] * intcode[safe: second]
                pointer += instruction.increment
            case .input:
                intcode[safe: first] = inputCopy.popLast() ?? 0
                pointer += instruction.increment
            case .output:
                output = intcode[safe: first]
                pointer += instruction.increment
            case .equals:
                intcode[safe: third] = (intcode[safe: first] == intcode[safe: second]) ? 1 : 0
                pointer += instruction.increment
            case .lessThan:
                intcode[safe: third] = (intcode[safe: first] < intcode[safe: second]) ? 1 : 0
                pointer += instruction.increment
            case .jumpIfTrue:
                if (intcode[safe: first] != 0) {
                    pointer = intcode[safe: second]
                } else {
                    pointer += instruction.increment
                }
            case .jumpIfFalse:
                if (intcode[safe: first] == 0) {
                    pointer = intcode[safe: second]
                } else {
                    pointer += instruction.increment
                }
            case .adjustRelativeBase:
                relativeBaseOffset = intcode[safe: first]
                pointer += instruction.increment
            case .halt:
                if (output != nil) {
                    intcode.append(output!)
                }
                return intcode
            }

        }
    }
    
    func readInstruction(from value: Int) -> Instruction {
        var digits = value.digits
        // Since leading zeros are optional fill array
        while(digits.count < 5) {
            digits.insert(0, at: 0)
        }
        
        let digitOpCode = digits.popLast()! + digits.popLast()! * 10
        let opCode = OpCode.init(rawValue: digitOpCode) ?? .addition
        
        let modeFirstParameter = ParameterMode.init(rawValue: digits.popLast()!) ?? .position
        let modeSecondParameter = ParameterMode.init(rawValue: digits.popLast()!) ?? .position
        let modeThirdParameter = ParameterMode.init(rawValue: digits.popLast()!) ?? .position

        return Instruction(opCode: opCode, modeFirstParameter: modeFirstParameter, modeSecondParameter: modeSecondParameter, modeThirdParameter: modeThirdParameter)
    }
    
    struct Instruction: Equatable {
        let opCode: OpCode
        let modeFirstParameter: ParameterMode
        let modeSecondParameter: ParameterMode
        let modeThirdParameter: ParameterMode
        
        var increment: Int {
            switch opCode {
            case .addition, .multiplication, .equals, .lessThan:
                return 4
            case .jumpIfFalse, .jumpIfTrue:
                return 3
            case .input, .output, .adjustRelativeBase:
                return 2
            case .halt:
                return 1
            }
        }
    }
    
    enum OpCode: Int {
        case addition = 1
        case multiplication = 2
        case input = 3
        case output = 4
        case jumpIfTrue = 5
        case jumpIfFalse = 6
        case lessThan = 7
        case equals = 8
        case adjustRelativeBase = 9
        case halt = 99
    }
    
    enum ParameterMode: Int {
        case position = 0
        case immediate = 1
        case relative = 2
    }
}
