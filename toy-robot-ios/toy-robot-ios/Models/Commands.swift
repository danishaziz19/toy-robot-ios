//
//  Commands.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 6/11/2025.
//

import Foundation

enum Commands {
    case place(position: Position, direction: Direction)
    case move // MOVE: will move the toy robot one unit forward in the direction it is currently facing.
    case left // LEFT: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
    case right // RIGHT: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
    case report // REPORT: will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
}
