//
//  TableView.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 7/11/2025.
//

import SwiftUI

struct TableView: View {
    @ObservedObject var robot: Robot
    var table: Table

    var body: some View {
        VStack(spacing: 2) {
            // reversed because origin is south west (0, 0)
            ForEach((0..<table.height).reversed(), id: \.self) { y in
                HStack(spacing: 2) {
                    ForEach(0..<table.width, id: \.self) { x in
                        ZStack {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 50, height: 50)
                        
                            if isRobotHere(at: Position(x: x, y: y)) {
                                Image(systemName: directionIcon(robot.direction))
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func isRobotHere(at position: Position) -> Bool {
        robot.position.x == position.x && robot.position.y == position.y
    }

    private func directionIcon(_ direction: Direction) -> String {
        switch direction {
        case .north: return "arrow.up"
        case .south: return "arrow.down"
        case .east:  return "arrow.right"
        case .west:  return "arrow.left"
        }
    }
}

#Preview {
    TableView(robot: Robot(position: Position(x: 0, y: 0), direction: .north), table: Table(width: 5, height: 5))
}
