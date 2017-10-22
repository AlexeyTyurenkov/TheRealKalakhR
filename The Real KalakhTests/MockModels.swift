//
//  MockModels.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import The_Real_Kalakh

@testable import The_Real_Kalakh

class MockModels
{
    struct Position: PositionProtocol
    {
        var side: Int = 6
        
        func move(index: Int) throws -> Bool {
            return true
        }
        
        func at(_ index: Int) -> Int {
            return 0
        }
        
        var myKalakh: Int = 0
        var enemyKalakh: Int = 0
        
    }
}
