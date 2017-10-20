//
//  SimpleAI.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/20/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


class SimpleAI: AIProtocol {
    
    func solve(on position: PositionProtocol, success: (Int) -> ()) {
        Thread.sleep(forTimeInterval: 10)
        success(0)
    }
    
    
}
