//
//  toy_robot_iosTests.swift
//  toy-robot-iosTests
//
//  Created by Danish Aziz on 6/11/2025.
//

import XCTest
@testable import toy_robot_ios

final class toy_robot_iosTests: XCTestCase {

    var viewModel: ToyRobotViewModel!
    override func setUp() async throws {
        try await super.setUp()
        
        viewModel = await MainActor.run {
            ToyRobotViewModel()
        }
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - PLACE Command
    @MainActor func testPlaceRobot() {
        viewModel.addCommand(.place(position: Position(x: 0, y: 0), direction: .north))
        viewModel.executeCommands()
        XCTAssertEqual(viewModel.robot.position, Position(x: 0, y: 0))
        XCTAssertEqual(viewModel.robot.direction, .north)
    }

    // MARK: - MOVE Command
    @MainActor func testMoveRobotWithinBounds() {
        viewModel.addCommand(.place(position: Position(x: 0, y: 0), direction: .north))
        viewModel.addCommand(.move)
        viewModel.executeCommands()
        XCTAssertEqual(viewModel.robot.position, Position(x: 0, y: 1))
    }

    @MainActor func testMoveRobotAtEdgeDoesNotFall() {
        viewModel.addCommand(.place(position: Position(x: 0, y: 4), direction: .north))
        viewModel.addCommand(.move)
        viewModel.executeCommands()
        XCTAssertEqual(viewModel.robot.position, Position(x: 0, y: 4)) // cannot move off table
    }

    // MARK: - LEFT/RIGHT Commands
    @MainActor func testRotateLeft() {
        viewModel.addCommand(.place(position: Position(x: 1, y: 1), direction: .north))
        viewModel.addCommand(.left)
        viewModel.executeCommands()
        XCTAssertEqual(viewModel.robot.direction, .west)
    }

    @MainActor func testRotateRight() {
        viewModel.addCommand(.place(position: Position(x: 1, y: 1), direction: .north))
        viewModel.addCommand(.right)
        viewModel.executeCommands()
        XCTAssertEqual(viewModel.robot.direction, .east)
    }

    // MARK: - Multiple Commands
    @MainActor func testSequenceOfCommands() {
        viewModel.addCommand(.place(position: Position(x: 1, y: 2), direction: .east))
        viewModel.addCommand(.move)
        viewModel.addCommand(.move)
        viewModel.addCommand(.left)
        viewModel.addCommand(.move)
        viewModel.executeCommands()

        XCTAssertEqual(viewModel.robot.position, Position(x: 3, y: 3))
        XCTAssertEqual(viewModel.robot.direction, .north)
    }

    // MARK: - REPORT Command (optional check)
    @MainActor func testReportCommand() {
        viewModel.addCommand(.place(position: Position(x: 0, y: 0), direction: .north))
        viewModel.addCommand(.report)
        viewModel.executeCommands()
        XCTAssertEqual(viewModel.robot.position, Position(x: 0, y: 0))
        XCTAssertEqual(viewModel.robot.direction, .north)
    }
}
