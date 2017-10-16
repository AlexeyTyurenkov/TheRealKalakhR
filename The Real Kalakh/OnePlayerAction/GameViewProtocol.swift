//
//  OnePlayerProtocol.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/16/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

protocol GameViewProtocol: class
{
    var presenter: GamePresenterProtocol! { get set }
}

