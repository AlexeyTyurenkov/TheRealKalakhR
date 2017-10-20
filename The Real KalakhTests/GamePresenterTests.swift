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
    
    override func setUp() {
        super.setUp()
        presenter.userInterface = controller
        presenter.router = router
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
    
    func testShowPosition() {
        presenter.userInterface.show(position: MockModels.Position())
        XCTAssertTrue(controller.isPositionShown, "Controller haven't displayed position")
    }
    
}
