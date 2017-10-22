//
//  OnePlayerViewController.swift
//  The Real Kalakh
//
//  Created by Aleksey Tyurenkov on 10/16/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import UIKit

class SimpleGameViewController: UIViewController, GameViewProtocol {
    
    //MARK: - Outlets
    @IBOutlet weak var enemyStack: UIStackView!
    @IBOutlet weak var myStack: UIStackView!
    @IBOutlet weak var enemyKalah: UILabel!
    @IBOutlet weak var myKalah: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    func unlockForMove(_ unlock: Bool) {
        myStack.arrangedSubviews.forEach { (view) in
            view.isUserInteractionEnabled = unlock
        }
        activityIndicator.isHidden = unlock
        if !unlock
        {
            activityIndicator.startAnimating()
        }
        else
        {
            activityIndicator.stopAnimating()
        }
        if !unlock
        {
            presenter.viewIsReadyForUpdate()
        }
    }
    
    func set(state: GameState) {
        
    }
    
    var presenter: GamePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func show(position: PositionProtocol) {
        if myStack.arrangedSubviews.count == 0
        {
            setupCells(range: (0..<position.side).map{ $0 }, stack: myStack)
            setupCells(range: ((position.side + 1)..<(2*position.side + 1)).reversed().map { $0 }, stack: enemyStack)
            enemyStack.arrangedSubviews.forEach { (view) in
                view.isUserInteractionEnabled = false
            }
        }
        for i in 0..<(position.side * 2 + 2 - 1) {
            if i == position.side
            {
                continue
            }
            if let button = self.view.viewWithTag(1000 + i) as? UIButton
            {
                button.setTitle("\(position.at(i))", for: UIControlState.normal)
            }
        }
        myKalah.text = "\(position.myKalakh)"
        enemyKalah.text = "\(position.enemyKalakh)"
    }
    
    private func setupCells(range: [Int], stack: UIStackView)
    {
        for i in range
        {
            let button = UIButton()
            button.addTarget(self, action: #selector(self.buttonPressed(button:)), for: .touchUpInside)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.red, for: .selected)
            button.tag = 1000 + i
            stack.addArrangedSubview(button)
        }
    }
    
    
    @objc private func buttonPressed(button: UIButton)
    {
        presenter.didTappedElement(index: button.tag - 1000)
    }
    


}
