//
//  Commands.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 6/11/2025.
//

import Foundation

enum Commands: String {
    case move = "MOVE" // MOVE: will move the toy robot one unit forward in the direction it is currently facing.
    case left = "LEFT" // LEFT: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
    case right = "RIGHT" // RIGHT: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
    case report = "REPORT" // REPORT: will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
}
