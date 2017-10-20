//
//  Position.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

enum MoveError: Error {
    case EmptyCell
    case MyKalakh
    case EnemyKalakh
}

protocol PositionProtocol
{
    func at(_ index: Int) -> Int
    
    mutating func move(index:Int) throws -> Bool
    var myKalakh: Int {get}
    var enemyKalakh: Int { get }
}

struct Position: PositionProtocol
{
    private var holes:[Int]
    private let side: Int
    private let total: Int
    init(oneside:Int = 6, seeds: Int = 6) {
        self.side = oneside
        self.total = 2 * oneside * seeds
        holes = Array(repeating: seeds, count: (oneside * 2 + 2))
        holes[oneside] = 0
        holes[2*oneside + 1] = 0
    }
    
    func at(_ index:Int) -> Int
    {
        let index = index % holes.count
        return holes[index]
    }
    
    mutating func move(index: Int) throws -> Bool {
        guard index != side else { throw MoveError.MyKalakh}
        guard index != (2 * side + 1) else { throw MoveError.EnemyKalakh}
        var current = at(index)
        guard current != 0 else { throw MoveError.EmptyCell }
        let player = (0...5).contains(index)
        var i = index
        holes[i] = 0
        while current > 0 {
            i = (i + 1) % holes.count
            //pass otherside kalakh
            if (!player && i == side) || (player && i == (2 * side + 1) )
            {
                continue
            }
            holes[i] = holes[i] + 1
            current = current - 1
            //Capture
            if (current == 0) && (holes[i] == 1) && ( ( player ? 0...(side-1) : (side + 1)...(2 * side)).contains(i)) 
            {
                let oppositeIndex = 2 * side - i
                holes[side] = holes[side] + holes[oppositeIndex] + 1
                holes[oppositeIndex] = 0
                holes[i] = 0
            }
        }
        return (player && i == side) || (!player && i == (2 * side + 1) )
    }
    
    var myKalakh: Int
    {
        return holes[side]
    }
    
    var enemyKalakh: Int
    {
        return holes[2*side + 1]
    }
}


