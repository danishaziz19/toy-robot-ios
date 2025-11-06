//
//  Table.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 6/11/2025.
//

import Foundation

struct Table {
    let width: Int
    let height: Int
    
    func isValidPosition(_ position: Position) -> Bool {
        return position.x >= 0 && position.x < width && position.y >= 0 && position.y < height
    }
}
