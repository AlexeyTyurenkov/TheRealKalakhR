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
        XCTAssertNotNil((controller as? GameViewProtocol)?.presenter, "Presenter Should be present")
        XCTAssertNotNil((controller as? GameViewProtocol)?.presenter as? GamePresenterProtocol, "Presenter should conform the protocol")
        
    }
    
    func testPresenter() {
        if let controller = controller as? GameViewProtocol
        {
            if let presenter = controller.presenter
            {
                
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
    
    
}
