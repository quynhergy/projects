//
//  ViewController.swift
//  Calculator
//
//  Created by Quynh Nguyen on 6/10/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    private var addDecimal: Bool = true
    private var calculator = CalculatorLogic()
    
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Unable to convert display label text to a double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        if let num = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = num
                isFinishedTyping = false
            } else {
                if num == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + num
            }
            
        }
    }
    
    @IBAction func calcBtnPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
}
