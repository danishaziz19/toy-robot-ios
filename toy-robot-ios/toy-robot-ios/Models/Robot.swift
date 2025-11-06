//
//  Robot.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 6/11/2025.
//

import SwiftUI

final class Robot: ObservableObject {
    @Published var position: Position
    @Published var direction: Direction

    init(position: Position, direction: Direction) {
        self.position = position
        self.direction = direction
    }
}
