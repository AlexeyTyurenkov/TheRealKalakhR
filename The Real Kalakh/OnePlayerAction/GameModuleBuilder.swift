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
        if let controller = UIStoryboard(name: "Game", bundle: nil).instantiateInitialViewController() {
            if let controller = controller as? GameViewProtocol
            {
                controller.presenter = GamePresenter()
                controller.presenter.userInterface = controller
                
            }
            return controller
        }
        return UIViewController()
    }
    
    
    
}





