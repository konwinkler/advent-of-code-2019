//
//  Day7.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/11/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

class Day7 {
    
    func computePhases(with sequence: [Int], on intcode: [Int]) -> Int {
        var output: Int?
        sequence.forEach({
            var input = [$0]
            if( output != nil) {
                input.append(output!)
            }
            output = self.compute(input: input, program: intcode).last ?? 0
        })
        
        return output ?? 0
    }
    
    func compute(input inputValues: [Int], program original: [Int]) -> [Int] {
        var pointer = 0
        var intcode = original
        var output = 0
        var inputCopy = inputValues.reversed() as [Int]
        
        while true {
            let instruction = self.readInstruction(from: intcode[pointer])

            switch instruction.opCode {
            case .Addition:
                let first = instruction.modeFirstParameter == .Position ? intcode[pointer + 1] : pointer + 1
                let second = instruction.modeSecondParameter == .Position ? intcode[pointer + 2] : pointer + 2
                let target = instruction.modeThirdParameter == .Position ? intcode[pointer + 3] : pointer + 3
                intcode[target] = intcode[first] + intcode[second]
            case .Multiplication:
                let first = instruction.modeFirstParameter == .Position ? intcode[pointer + 1] : pointer + 1
                let second = instruction.modeSecondParameter == .Position ? intcode[pointer + 2] : pointer + 2
                let target = instruction.modeThirdParameter == .Position ? intcode[pointer + 3] : pointer + 3
                intcode[target] = intcode[first] * intcode[second]
            case .Input:
                let first = instruction.modeFirstParameter == .Position ? intcode[pointer + 1] : pointer + 1
                intcode[first] = inputCopy.popLast() ?? 0
            case .Output:
                let first = instruction.modeFirstParameter == .Position ? intcode[pointer + 1] : pointer + 1
                output = intcode[first]
            case .Halt:
                intcode.append(output)
                return intcode
            }

            pointer += instruction.increment
        }
    }
    
    func readInstruction(from value: Int) -> Instruction {
        var digits = value.digits
        // Since leading zeros are optional fill array
        while(digits.count < 5) {
            digits.insert(0, at: 0)
        }
        
        let digitOpCode = digits.popLast()! + digits.popLast()! * 10
        let opCode = OpCode.init(rawValue: digitOpCode) ?? .Addition
        
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
            case .Addition, .Multiplication:
                return 4
            case .Input, .Output:
                return 2
            default:
                return 1
            }
        }
    }
    
    enum OpCode: Int {
        case Addition = 1
        case Multiplication = 2
        case Input = 3
        case Output = 4
        case Halt = 99
    }
    
    enum ParaneterMode: Int {
        case Position = 0
        case Immediate = 1
    }
    
}
