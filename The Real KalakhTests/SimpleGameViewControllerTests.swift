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
    let presenter = MockPresenter()
    override func setUp() {
        super.setUp()
        controller.presenter = presenter
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
    
    
    //Mock Presenter
    
    class MockPresenter: GamePresenterProtocol {
        var router: GameRouterProtocol!
        var userInterface: GameViewProtocol!
        var visited: Bool = false
        func viewIsReady() {
            visited = true
        }
    }
    
}
