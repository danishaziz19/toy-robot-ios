//
//  RobotEngine.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 6/11/2025.
//

import Foundation

enum MoveResult {
    case success
    case blocked(reason: String)
}

protocol RobotEngine {
    func move(robot: Robot, on table: Table) -> MoveResult
    func left(robot: Robot)
    func right(robot: Robot)
}

class DefaultRobotEngine: RobotEngine {
    func move(robot: Robot, on table: Table) -> MoveResult {
        var position = robot.position
        
        switch robot.direction {
        case .north:
            position.y += 1
        case .south:
            position.y -= 1
        case .east:
            position.x += 1
        case .west:
            position.x -= 1
        }
        
        guard table.isValidPosition(position) else {
            return .blocked(reason: "Cannot move outside the table")
        }
        
        robot.position = position
        return .success
    }
    
    func left(robot: Robot) {
        robot.direction = robot.direction.rotateLeft()
    }
    
    func right(robot: Robot) {
        robot.direction = robot.direction.rotateRight()
    }
}
