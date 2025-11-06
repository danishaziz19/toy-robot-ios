//
//  ToyRobotViewModel.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 6/11/2025.
//

import SwiftUI

@MainActor
final class ToyRobotViewModel: ObservableObject {
    @Published var robot: Robot
    @Published var message: String = ""
    @Published var commandQueue: [Commands] = []
    @Published var isRobotPlaced: Bool = false
    
    let table: Table
    private let robotEngine: RobotEngine
    
    init() {
        self.robot = Robot(position: Position(x: 0, y: 0), direction: .north)
        self.table = Table(width: 5, height: 5)
        self.robotEngine = DefaultRobotEngine()
    }
    
    // Add command in the queue
    func addCommand(_ command: Commands) {
        commandQueue.append(command)
        message = "Command added: \(commandDescription(command))"
    }
    
    // Execute all commands in the queue
    func executeCommands() {
        for command in commandQueue {
            switch command {
            case let .place(position, direction):
                place(x: position.x, y: position.y, direction: direction)
            case .move:
                if !move() {
                    commandQueue.removeAll()
                    return
                }
            case .left:
                left()
            case .right:
                right()
            case .report:
                report()
            }
        }
        commandQueue.removeAll()
    }
    
    func commandDescription(_ command: Commands) -> String {
        switch command {
        case let .place(position, direction): return "PLACE \(position.x),\(position.y),\(direction.rawValue.uppercased())"
        case .move: return "MOVE"
        case .left: return "LEFT"
        case .right: return "RIGHT"
        case .report: return "REPORT"
        }
    }
    
    private func place(x: Int, y: Int, direction: Direction) {
        let position = Position(x: x, y: y)
        
        guard table.isValidPosition(position) else {
            message = "Invalid place position"
            return
        }
        
        robot.position = position
        robot.direction = direction
        message = "Robot placed at (\(x), \(y)) facing \(direction.rawValue)"
    }
    
    private func move() -> Bool {
        let result = robotEngine.move(robot: robot, on: table)
       switch result {
       case .success:
           return true
       case let .blocked(reason):
           message = reason
           return false
        }
    }
    
    private func left() {
        robotEngine.left(robot: robot)
    }
    
    private func right() {
        robotEngine.right(robot: robot)
    }
    
    private func report() {
        message = "Robot at (\(robot.position.x), \(robot.position.y)) facing \(robot.direction.rawValue)"
    }
}
