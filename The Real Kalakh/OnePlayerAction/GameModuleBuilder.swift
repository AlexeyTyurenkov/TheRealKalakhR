//
//  OnePlayerModuleBuilder.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/16/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit


class GameModuleBuilder
{
    func build() -> UIViewController
    {
        let presenter = GamePresenter()
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() {
            controller.injectPresenter(presenter)
            presenter.router = GameRouter()
            presenter.router.presenter = presenter
            presenter.interactor = GameInteractor()
            presenter.interactor.ai = SimpleAI()
            presenter.interactor.presenter = presenter
            return controller
        }
       return UIViewController()
    }
    

    
}

extension UIViewController
{
    func injectPresenter(_ presenter:GamePresenterProtocol? = nil)
    {
        if let controller = self as? GameViewProtocol
        {
            controller.presenter = presenter ?? GamePresenter()
            controller.presenter.userInterface = controller
        }
    }
}



