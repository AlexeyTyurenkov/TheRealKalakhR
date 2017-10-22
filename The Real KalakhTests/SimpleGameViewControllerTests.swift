//
//  SimpleGameViewControllerTests.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import XCTest
import The_Real_Kalakh

@testable import The_Real_Kalakh

class SimpleGameViewControllerTests: XCTestCase {
    
    let controller = UIStoryboard(name: "Game", bundle: Bundle.main).instantiateInitialViewController() as? SimpleGameViewController
    let presenter = MockClass.Presenter()
    override func setUp() {
        super.setUp()
        controller?.presenter = presenter
        presenter.userInterface = controller
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testControllerLifeCycleDidLoad() {
        guard let controller = controller else { XCTFail("Controller should be loaded from the storyboard"); return }
        controller.viewDidLoad()
        XCTAssertTrue(presenter.visited, "View did load should call view is ready")
    }
    
    func testControllerShow()
    {
        guard let controller = controller else { XCTFail("Controller should be loaded from the storyboard"); return }
        controller.presenter = MockClass.PositionPresenter()
        controller.presenter.userInterface = controller
        XCTAssertNotNil(controller.view)
        XCTAssertEqual(controller.myStack.arrangedSubviews.count, 6)
        XCTAssertEqual(controller.enemyStack.arrangedSubviews.count, 6)
    }

    
    //TO DO:
    
    func testDidTapped() {
        
    }
    
    func testShowError() {
        
    }
}
