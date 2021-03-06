//
//  GameRouterTests.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import XCTest
import The_Real_Kalakh

@testable import The_Real_Kalakh


class GameRouterTests: XCTestCase {
    
    
    let router = GameRouter()
    
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
        router.presenter = presenter
        XCTAssertNotNil(router.presenter, "Presenter should exist")
        presenter = nil
        XCTAssertNil(router.presenter, "Presenter should be weak link")
    }
    
    
}
