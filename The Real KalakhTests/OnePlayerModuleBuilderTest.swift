//
//  OnePlayerModuleBuilderTest.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/16/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import XCTest
import The_Real_Kalakh

@testable import The_Real_Kalakh

//protocol GameViewProtocol

class OnePlayerModuleBuilderTest: XCTestCase {
    
    var builder: GameModuleBuilder!
    var controller: UIViewController!
    
    override func setUp() {
        super.setUp()
        builder = GameModuleBuilder()
        controller = builder.build()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateInitialController() {
        XCTAssertTrue((controller is GameViewProtocol), "Controller Should be Game View Protocol")
        
    }
    
    func testPresenter() {
        if let controller = controller as? GameViewProtocol
        {
            if let presenter = controller.presenter
            {
                XCTAssertNotNil(presenter.userInterface, "User Interface for presenter should exist")
                XCTAssertNotNil(presenter.router, "Router should exist")
                XCTAssertNotNil(presenter.interactor, "Iterator should exists")
            }
            else
            {
                XCTFail("Presenter didn't initialized")
            }
        }
        else
        {
            XCTFail("Controller should follow One Player View Protocol")
        }
    }
    
    func testRouter() {
        guard let router = (controller as? GameViewProtocol)?.presenter?.router else { XCTFail("Controller didn't setup correctly "); return }
        XCTAssertNotNil(router.presenter, "Presenter should be set up in router")
    }
    
    func testInteractor() {
        guard let interactor = (controller as? GameViewProtocol)?.presenter?.interactor else { XCTFail("Controller didn't setup correctly: Interactor missed "); return }
        XCTAssertNotNil(interactor.presenter, "Presenter should be set up in interactor")
    }
    
}
