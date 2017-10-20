//
//  PlayPresenter.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/16/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


class GamePresenter: GamePresenterProtocol
{
    func viewIsReadyForUpdate() {
        interactor.makeAIMove()
        userInterface.unlockForMove(false)
        
    }
    
    func didTappedElement(index: Int) {
        interactor.makeMove(index: index)
        userInterface.unlockForMove(false)
    }
    
    func show(state: GameState, position: Position, yourMove: Bool) {
        userInterface.show(position: position)
        userInterface.unlockForMove(true)
        userInterface.set(state: state)
    }
    
    func show(error: MoveError) {
        
    }
    

    
    weak var userInterface: GameViewProtocol!
    var router: GameRouterProtocol!
    var interactor: GameInteractorProtocol!
    
    func viewIsReady() {
        interactor.getPosition()
    }
    

    
}
