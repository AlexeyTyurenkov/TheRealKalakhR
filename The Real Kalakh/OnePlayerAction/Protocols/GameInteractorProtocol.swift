//
//  GameInteractor.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

enum GameState {
    case Player1Win
    case Player2Win
    case Play
    case Draw
}

protocol GameInteractorProtocol {
    
    var ai: AIProtocol! { get set }
    var presenter: GamePresenterProtocol! {get set}
    //Presenter OutPut
    var inProgress: Bool { get }
    
    //Presenter Input
    func getPosition()
    func makeMove(index: Int)
    func makeAIMove()
    
}
