//
//  GameInteractorTests.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import XCTest
import The_Real_Kalakh

@testable import The_Real_Kalakh


class GameInteractorTests: XCTestCase {
    
    
    let interactor = GameInteractor()
    let presenter = MockClass.Presenter()
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWeakness() {
        var presenter: GamePresenterProtocol? = MockClass.Presenter()
        interactor.presenter = presenter
        XCTAssertNotNil(interactor.presenter, "Presenter should exist")
        presenter = nil
        XCTAssertNil(interactor.presenter, "Presenter should be weak link")
    }
    
    func testMoveFromCell() {
        interactor.presenter = presenter
        interactor.makeMove(index: 0)
        XCTAssertNotNil(presenter.shownPosition, "Position should be shown")
        XCTAssertEqual(presenter.shownPosition.at(0), 0, "Cell should be clear")
        XCTAssertEqual(presenter.shownPosition.myKalakh, 1, "One seed in the kalah")
        XCTAssertTrue(presenter.canPlay, "Can play")
    }
    
    func testMoveAI() {
        interactor.ai = SimpleAI()
        let expectation = XCTestExpectation(description: "AI Move Expectation")
        presenter.aiFinishBlock = {
            expectation.fulfill()
        }
        interactor.presenter = presenter
        interactor.makeAIMove()
        XCTAssertTrue(interactor.inProgress, "AI should calculate")
        wait(for: [expectation], timeout: TimeInterval(integerLiteral: 100))
        XCTAssertFalse(interactor.inProgress, "AI should stop calculation")
    }
    
    
    
}
