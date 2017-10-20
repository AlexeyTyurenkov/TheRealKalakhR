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
    weak var userInterface: GameViewProtocol!
    var router: GameRouterProtocol!
    var interactor: GameInteractorProtocol!
    
    func viewIsReady() {
        
    }
}
