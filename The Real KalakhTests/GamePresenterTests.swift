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
    
    let controller = MockGameView()
    let presenter = GamePresenter()
    let router = MockRouter()
    
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
    
    func testExample() {
        
    }
    
    class MockGameView: GameViewProtocol
    {
        var presenter: GamePresenterProtocol!
        
    }
    
    class MockRouter: GameRouterProtocol
    {
        var presenter: GamePresenterProtocol!
    }
    
}
