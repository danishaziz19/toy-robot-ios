//
//  ContentView.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 6/11/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ToyRobotViewModel()

    var body: some View {
        VStack {
            TableView(robot: viewModel.robot, table: viewModel.table)
                .frame(width: 300, height: 300)
                .border(Color.black)

            Text(viewModel.message)
                .padding()

            ControlsView(viewModel: viewModel)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
