//
//  GamePresenterTests.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import XCTest
import The_Real_Kalakh

@testable import The_Real_Kalakh


class GamePresenterTests: XCTestCase {
    
    let controller = MockClass.GameView()
    let presenter = GamePresenter()
    let router = MockClass.Router()
    let interactor = MockClass.Interactor()
    
    override func setUp() {
        super.setUp()
        presenter.userInterface = controller
        presenter.router = router
        presenter.interactor = interactor
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWeakness() {
        var weakController: GameViewProtocol? = MockClass.GameView()
        weakController?.presenter = presenter
        presenter.userInterface = weakController
        XCTAssertNotNil(presenter.userInterface, "Presenter should hold reference to controller")
        weakController = nil
        XCTAssertNil(presenter.userInterface, "Presenter should release controller")
    }
    
    func testStrongLinkToInteractor() {
        var weakInteractor: GameInteractorProtocol? = MockClass.Interactor()
        presenter.interactor = weakInteractor
        weakInteractor = nil
        XCTAssertNotNil(presenter.interactor, "Presenter should hold reference to interactor")
    }
    
    func testShowPosition() {
        presenter.userInterface.show(position: MockModels.Position())
        XCTAssertTrue(controller.isPositionShown, "Controller haven't displayed position")
    }
    
    func testAskInteractor() {
        presenter.viewIsReady()
        XCTAssert(interactor.isPositionAsked, "Should ask for current position when view is ready")
    }
    
    func testShowPositionFromInteractor() {
        presenter.show(state: .Play, position: Position(), yourMove: false)
        XCTAssertTrue(controller.isPositionShown, "Position should be shown")
        XCTAssertTrue(controller.isGameContinous, "Controller is playable")
        XCTAssertTrue(controller.canPlayerMove, "Player can play")
    }
    
    func testMoveFromController() {
        presenter.didTappedElement(index:1)
        XCTAssertEqual(interactor.lastMove, 1, "Should pass move index to iterator")
    }
    
    func testUpdateView() {
        presenter.viewIsReadyForUpdate()
        XCTAssertTrue(interactor.inProgress, "Should start calculations")
    }
    
    func testShowError() {
        presenter.show(error: .EmptyCell)
    }
    
}
