//
//  GameInteractor.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/17/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

class GameInteractor: GameInteractorProtocol
{

    weak var presenter: GamePresenterProtocol!
    private var state: GameState = .Play
    private var position: Position = Position()
    private var player05: Bool = true
    private var semaphore = DispatchSemaphore(value: 1)
    var ai: AIProtocol!
    
    func getPosition() {
        presenter.show(state: state, position: position, yourMove: true)
    }
    
    func makeMove(index: Int) {
        do {
            let result = try position.move(index: index)
            presenter.show(state: state, position: position, yourMove: result)
        } catch let error as MoveError {
            presenter.show(error: error)
        }
        catch
        {
            presenter.show(error: .EmptyCell)
        }
        
    }
    
    func makeAIMove() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.semaphore.wait()
            self.ai.solve(on: self.position) { (result) in
                self.makeMove(index: result)
                self.semaphore.signal()
            }
        }
    }
    
    var inProgress: Bool
    {
        return semaphore.wait(timeout: DispatchTime(uptimeNanoseconds: 1)) == .timedOut
    }
}
