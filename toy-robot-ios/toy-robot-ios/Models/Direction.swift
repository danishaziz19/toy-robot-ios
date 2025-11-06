//
//  Direction.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 6/11/2025.
//

import Foundation

enum Direction: String, CaseIterable {
    case north = "NORTH"
    case east = "EAST"
    case south = "SOUTH"
    case west = "WEST"
    
    func rotateRight() -> Direction {
        switch self {
        case .north:
            return .east
        case .east:
            return .south
        case .south:
            return .west
        case .west:
            return .north
        }
    }
    
    func rotateLeft() -> Direction {
        switch self {
        case .north:
            return .west
        case .east:
            return .north
        case .south:
            return .east
        case .west:
            return .south
        }
    }
}
