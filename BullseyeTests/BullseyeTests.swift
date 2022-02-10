//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Yuliia Ivanechko on 06.02.2022.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase
{
    var game: Game!
    override func setUpWithError() throws
    {
        game = Game()
    }

    override func tearDownWithError() throws
    {
        game = nil
    }

    func testScorePositive()
    {
        let guess = game.target + 5
        let score = game.points(var: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative()
    {
        let guess = game.target - 5
        let score = game.points(var: guess)
        XCTAssertEqual(score, 95)
    }

}
