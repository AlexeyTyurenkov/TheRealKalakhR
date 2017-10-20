//
//  PositionTests.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import XCTest
import The_Real_Kalakh

@testable import The_Real_Kalakh



class PositionTests: XCTestCase {

    var position: PositionProtocol!
    
    override func setUp() {
        super.setUp()
        position = Position()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultConstructor() {
        for i in 0..<14 {
            if (i == 6)
            {
                XCTAssertTrue(position.at(i) == 0, "First player kalakh isn't ready")
            }
            else if (i==13)
            {
                XCTAssertTrue(position.at(i) == 0, "Second player kalakh isn't ready")
            }
            else
            {
                XCTAssertTrue(position.at(i) == 6, "Hole \(i) contains \(position.at(i)) seeds")
            }
        }
        XCTAssertEqual(position.myKalakh, 0, "Start kalakh is empty")
        XCTAssertEqual(position.enemyKalakh, 0, "Start kalakh is empty")
    }
    
    func testPositionMoveFromZeroPosition() {
        var result = false
        XCTAssertNoThrow(result = try position.move(index: 0), "First cell is normal for moving")
        XCTAssertTrue(result, "You can move twice after move from this cell")
        XCTAssertEqual(position.myKalakh, 1, "My kalakh should contain 1 seed")
        XCTAssertEqual(position.enemyKalakh, 0, "My kalakh should contain 0 seed")
        XCTAssertEqual(position.at(0), 0, "first cell should be empty")
        for i in 1..<6
        {
            XCTAssertEqual(position.at(i), 7, "CEll at index \(i) should contain 7 seeds")
        }
        XCTAssertThrowsError(result = try position.move(index: 0), "You can't move from the same position twice") { (error) in
            guard let error = error as? MoveError else { XCTFail("Should be an Move error"); return }
            switch error
            {
                case MoveError.MyKalakh, MoveError.EnemyKalakh: XCTFail("Should be a Epmty cell error")
                default: break
            }
        }
        
    }
    
    func testPositionMoveFromLastPosition() {
        var result = false
        XCTAssertNoThrow(result = try position.move(index: 5), "Last cell is normal for moving")
        XCTAssertFalse(result, "You can not move twice after move from this cell")
        XCTAssertEqual(position.myKalakh, 1, "My kalakh should contain 1 seed")
        XCTAssertEqual(position.enemyKalakh, 0, "My kalakh should contain 0 seed")
        XCTAssertEqual(position.at(5), 0, "Last cell should be empty")
        for i in 0..<5
        {
            XCTAssertEqual(position.at(i), 6, "CEll at index \(i) should contain 6 seeds")
        }
        for i in 7...11
        {
            XCTAssertEqual(position.at(i), 7, "CEll at index \(i) should contain 7 seeds")
        }
        XCTAssertEqual(position.at(12), 6, "Last enemy cell should contain 6 seeds")
        XCTAssertThrowsError(result = try position.move(index: 5), "You can't move from the same position twice") { (error) in
            guard let error = error as? MoveError else { XCTFail("Should be an Move error"); return }
            switch error
            {
            case MoveError.MyKalakh, MoveError.EnemyKalakh: XCTFail("Should be a Epmty cell error")
            default: break
            }
        }
    }
    
    func testMoveFromMyKalakh() {
        XCTAssertThrowsError(_ = try position.move(index: 6), "You can't move from the own khalakh") { (error) in
            guard let error = error as? MoveError else { XCTFail("Should be an Move error"); return }
            switch error
            {
            case MoveError.EmptyCell, MoveError.EnemyKalakh: XCTFail("Should be a My Kalakh cell error")
            default: break
            }
        }
        XCTAssertEqual(position.at(6), 0, "Kalakh can't change")
    }
    
    
    func testMoveFromEnemyKalakh() {
        XCTAssertThrowsError(_ = try position.move(index: 13), "You can't move from the enemy khalakh") { (error) in
            guard let error = error as? MoveError else { XCTFail("Should be an Move error"); return }
            switch error
            {
            case MoveError.EmptyCell, MoveError.MyKalakh: XCTFail("Should be a My Kalakh cell error")
            default: break
            }
        }
        XCTAssertEqual(position.at(13), 0, "Kalakh can't change")

    }
    
    func testAchievePositionAfterTwoMoves()
    {
        XCTAssertNotNil(try? position.move(index: 0), "Normal move")
        XCTAssertNotNil(try? position.move(index: 5), "Normal move")
        XCTAssertEqual(position.at(0), 0 , "First Kalakh empty")
        for i in 1..<5
        {
            XCTAssertEqual(position.at(i), 7, "CEll at index \(i) should contain 6 seeds")
        }
        XCTAssertEqual(position.at(5), 0, "Last Kalakh Empty")
        XCTAssertEqual(position.myKalakh, 2, "two seeds in my kalakh")
    }
    
    func testPositionAfterTwoMovesAndFirstEnemy()
    {
        XCTAssertNotNil(try? position.move(index: 0), "Normal move")
        XCTAssertNotNil(try? position.move(index: 5), "Normal move")
        XCTAssertNotNil(try? position.move(index: 7), "Normal enymy move")
        XCTAssertEqual(position.at(0), 1 , "First Kalakh empty")
        for i in 1..<5
        {
            XCTAssertEqual(position.at(i), 7, "CEll at index \(i) should contain 6 seeds")
        }
        XCTAssertEqual(position.at(5), 0, "Last Kalakh Empty")
        XCTAssertEqual(position.myKalakh, 2, "two seeds in my kalakh")
        XCTAssertEqual(position.enemyKalakh, 1, "two seeds in my kalakh")
    }
    
    func testPositionCapture()
    {
        XCTAssertNotNil(try? position.move(index: 0), "Normal move")
        XCTAssertNotNil(try? position.move(index: 5), "Normal move")
        XCTAssertNotNil(try? position.move(index: 7), "Normal enemy move")
        XCTAssertNotNil(try? position.move(index: 1), "Normal move")
        XCTAssertNotNil(try? position.move(index: 7), "Normal enemy move")
        XCTAssertEqual(position.at(0), 1 , "First Kalakh empty")
        XCTAssertEqual(position.at(1), 0 , "First Kalakh empty")
        for i in 2..<5
        {
            XCTAssertEqual(position.at(i), 8, "CEll at index \(i) should contain 6 seeds")
        }
        XCTAssertEqual(position.at(5), 1, "Last Kalakh Empty")
        XCTAssertEqual(position.myKalakh, 3, "two seeds in my kalakh")
        XCTAssertEqual(position.enemyKalakh, 1, "One seed in enemy kalakh")
        XCTAssertEqual(position.at(7), 0, "First enemy Kalakh contains one seed")
        XCTAssertEqual(position.at(8), 10, "Second enemy Kalakh contains 9 seeds")
        for i in 9..<13
        {
            XCTAssertEqual(position.at(i), 8, "CEll at index \(i) should contain 8 seeds")
        }
        XCTAssertNotNil(try? position.move(index: 0), "Normal move")
        XCTAssertEqual(position.at(0), 0 , "First Kalakh is empty")
        XCTAssertEqual(position.at(1), 0 , "First Kalakh is empty")
        XCTAssertEqual(position.at(11), 0 , "Kalakh before the last one is empty")
        XCTAssertEqual(position.myKalakh, 12 , "My Kalakh contains 12 seeds")

    }
}
