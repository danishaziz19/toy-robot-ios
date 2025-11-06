//
//  ControlsView.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 7/11/2025.
//

import SwiftUI

struct ControlsView: View {
    @ObservedObject var viewModel: ToyRobotViewModel

    @State private var placeX: Int = 0
    @State private var placeY: Int = 0
    @State private var placeDirection: Direction = .north

    var body: some View {
        VStack(spacing: 16) {
            
            // MARK: - Dynamic PLACE Inputs
            VStack(alignment: .leading, spacing: 8) {
                Text("Place Robot").font(.headline)
                
                HStack(spacing: 16) {
                    VStack {
                        Text("X: \(placeX)")
                        Stepper("", value: $placeX, in: 0...viewModel.table.width-1)
                            .labelsHidden()
                    }

                    VStack {
                        Text("Y: \(placeY)")
                        Stepper("", value: $placeY, in: 0...viewModel.table.height-1)
                            .labelsHidden()
                    }

                    VStack {
                        Text("Direction")
                        Picker("Direction", selection: $placeDirection) {
                            Text("NORTH").tag(Direction.north)
                            Text("SOUTH").tag(Direction.south)
                            Text("EAST").tag(Direction.east)
                            Text("WEST").tag(Direction.west)
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 100)
                    }
                }

                Button("PLACE") {
                    viewModel.addCommand(.place(position: Position(x: placeX, y: placeY),
                                                direction: placeDirection))
                    viewModel.addCommand(.report)
                    viewModel.executeCommands()
                    viewModel.isRobotPlaced = true
                }
                .smallBlackButtonStyle(enabled: !viewModel.isRobotPlaced)
                .disabled(viewModel.isRobotPlaced)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    Button("MOVE") { viewModel.addCommand(.move) }
                        .smallBlackButtonStyle(enabled: viewModel.isRobotPlaced)
                        .disabled(!viewModel.isRobotPlaced)
                    
                    Button("LEFT") { viewModel.addCommand(.left) }
                        .smallBlackButtonStyle(enabled: viewModel.isRobotPlaced)
                        .disabled(!viewModel.isRobotPlaced)
                    
                    Button("RIGHT") { viewModel.addCommand(.right) }
                        .smallBlackButtonStyle(enabled: viewModel.isRobotPlaced)
                        .disabled(!viewModel.isRobotPlaced)
                    
                    Button("REPORT") {
                        viewModel.addCommand(.report)
                        viewModel.executeCommands()
                    }
                    .smallBlackButtonStyle(enabled: viewModel.isRobotPlaced)
                    .disabled(!viewModel.isRobotPlaced)
                }
            }
            
            Text("Queue: \(viewModel.commandQueue.map { viewModel.commandDescription($0) }.joined(separator: " → "))")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
        .padding()
    }
}

#Preview {
    ControlsView(viewModel: ToyRobotViewModel())
}
