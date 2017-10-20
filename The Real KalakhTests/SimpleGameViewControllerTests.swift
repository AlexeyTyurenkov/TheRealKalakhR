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
    
    let controller = SimpleGameViewController()
    let presenter = MockClass.Presenter()
    override func setUp() {
        super.setUp()
        controller.presenter = presenter
        presenter.userInterface = controller
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testControllerLifeCycleDidLoad() {

        controller.viewDidLoad()
        XCTAssertTrue(presenter.visited, "View did load should call view is ready")
    }
    
    func testControllerShow()
    {
        controller.presenter.viewIsReady()
    }

    //TO DO:
    
    func testDidTapped() {
        
    }
    
    func testShowError() {
        
    }
}
