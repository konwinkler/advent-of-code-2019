//
//  Day5.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/7/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

class Day5 {

    func compute(input inputValue: Int, program original: [Int]) -> [Int] {
        var pointer = 0
        var intcode = original
        var output = 0
        
        while true {
            let instruction = self.readInstruction(from: intcode[pointer])
            let first = instruction.modeFirstParameter == .Position ? intcode[safe: pointer + 1] ?? 0 : pointer + 1
            let second = instruction.modeSecondParameter == .Position ? intcode[safe: pointer + 2] ?? 0 : pointer + 2
            let target = instruction.modeThirdParameter == .Position ? intcode[safe: pointer + 3] ?? 0 : pointer + 3

            switch instruction.opCode {
            case .addition:
                intcode[target] = intcode[first] + intcode[second]
                pointer += instruction.increment
            case .multiplication:
                intcode[target] = intcode[first] * intcode[second]
                pointer += instruction.increment
            case .input:
                intcode[first] = inputValue
                pointer += instruction.increment
            case .output:
                output = intcode[first]
                pointer += instruction.increment
            case .equals:
                intcode[target] = (intcode[first] == intcode[second]) ? 1 : 0
                pointer += instruction.increment
            case .lessThan:
                intcode[target] = (intcode[first] < intcode[second]) ? 1 : 0
                pointer += instruction.increment
            case .jumpIfTrue:
                if (intcode[first] != 0) {
                    pointer = intcode[second]
                } else {
                    pointer += instruction.increment
                }
            case .jumpIfFalse:
                if (intcode[first] == 0) {
                    pointer = intcode[second]
                } else {
                    pointer += instruction.increment
                }
            case .halt:
                intcode.append(output)
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
        
        let modeFirstParameter = ParaneterMode.init(rawValue: digits.popLast()!) ?? .Position
        let modeSecondParameter = ParaneterMode.init(rawValue: digits.popLast()!) ?? .Position
        let modeThirdParameter = ParaneterMode.init(rawValue: digits.popLast()!) ?? .Position

        return Instruction(opCode: opCode, modeFirstParameter: modeFirstParameter, modeSecondParameter: modeSecondParameter, modeThirdParameter: modeThirdParameter)
    }
    
    struct Instruction: Equatable {
        let opCode: OpCode
        let modeFirstParameter: ParaneterMode
        let modeSecondParameter: ParaneterMode
        let modeThirdParameter: ParaneterMode
        
        var increment: Int {
            switch opCode {
            case .addition, .multiplication, .equals, .lessThan:
                return 4
            case .jumpIfFalse, .jumpIfTrue:
                return 3
            case .input, .output:
                return 2
            default:
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
        case halt = 99
    }
    
    enum ParaneterMode: Int {
        case Position = 0
        case Immediate = 1
    }
    
}
