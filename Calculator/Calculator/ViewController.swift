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
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double.")
            }
            return number
        }
        set {
            return displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        if let userInput = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = userInput
                isFinishedTyping = false
            } else {
                if userInput == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + userInput
            }
        }
    }
    
    @IBAction func calcBtnPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        if let actionBtn = sender.currentTitle {
            if actionBtn == "%" {
                displayValue *= 0.01
            } else if actionBtn == "+/-" {
                displayValue *= -1
            } else if actionBtn == "AC" {
                displayLabel.text = "0"
            }
        }
    }
}
