//
//  AIProtocol.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/20/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


protocol AIProtocol
{
    func solve(on position:PositionProtocol, success:(Int)->()) 
}
