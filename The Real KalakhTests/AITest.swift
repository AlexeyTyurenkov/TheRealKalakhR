//
//  AITest.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/20/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import XCTest
import The_Real_Kalakh

@testable import The_Real_Kalakh
class AITest: XCTestCase {
    
    var ai: AIProtocol!
    
    override func setUp() {
        super.setUp()
        ai = SimpleAI()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMove() {
        let expectation = XCTestExpectation(description: "Test simple AI")
        ai.solve(on: Position()){ result in 
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20)
    }

    
    
}
