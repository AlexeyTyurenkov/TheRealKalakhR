//
//  MockClass.swift
//  The Real KalakhTests
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import The_Real_Kalakh

@testable import The_Real_Kalakh


class MockClass {
    
    class GameView: GameViewProtocol
    {
        func unlockForMove(_ can: Bool) {
            canPlayerMove = can
        }
        
        func set(state: GameState) {
            isGameContinous = state == .Play
        }
        
        var isPositionShown:Bool = false
        var isGameContinous:Bool = false
        var canPlayerMove: Bool = false
        
        
        var presenter: GamePresenterProtocol!
        
        func show(position: PositionProtocol)
        {
            isPositionShown = true
        }
    }
    
    class Router: GameRouterProtocol
    {
        var presenter: GamePresenterProtocol!
    }
    
    class Interactor: GameInteractorProtocol
    {
        var ai: AIProtocol!
        
        var inProgress: Bool = false
        
        func makeAIMove() {
            inProgress = true
        }
        
        var isPositionAsked = false
        var lastMove: Int = -1
        
        func getPosition() {
            isPositionAsked = true
        }
        
        func makeMove(index: Int) {
            lastMove = index
        }
        
        
        
        var presenter: GamePresenterProtocol!
        
        //Mock method
        
    }
    
    //Mock Presenter
    
    class Presenter: GamePresenterProtocol {
        
        var shownPosition: Position!
        var canPlay: Bool = false
        var aiFinishBlock: (()->())?
        
        func viewIsReadyForUpdate() {
            
        }
        
        func didTappedElement(index: Int) {
            
        }
        
        
        func show(state: GameState, position: Position, yourMove: Bool) {
            shownPosition = position
            canPlay = yourMove
            aiFinishBlock?()
        }
        
        func show(error: MoveError) {
            
        }
        
        var interactor: GameInteractorProtocol!
        var router: GameRouterProtocol!
        var userInterface: GameViewProtocol!
        var visited: Bool = false
        
        func viewIsReady() {
            visited = true
        }
    }
    
    class PositionPresenter: GamePresenterProtocol {
        
        var shownPosition: Position!
        var canPlay: Bool = false
        var aiFinishBlock: (()->())?
        
        func viewIsReadyForUpdate() {
            
        }
        
        func didTappedElement(index: Int) {
            
        }
        
        
        func show(state: GameState, position: Position, yourMove: Bool) {
            shownPosition = position
            canPlay = yourMove
            aiFinishBlock?()
        }
        
        func show(error: MoveError) {
            
        }
        
        var interactor: GameInteractorProtocol!
        var router: GameRouterProtocol!
        var userInterface: GameViewProtocol!
        var visited: Bool = false
        
        func viewIsReady() {
            visited = true
            userInterface.show(position: Position())
        }
    }
    
}
