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
        var isPositionShown:Bool = false
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
        var presenter: GamePresenterProtocol!
        
        
    }
    
    //Mock Presenter
    
    class Presenter: GamePresenterProtocol {
        var interactor: GameInteractorProtocol!
        var router: GameRouterProtocol!
        var userInterface: GameViewProtocol!
        var visited: Bool = false
        func viewIsReady() {
            visited = true
        }
    }
    
    
}
