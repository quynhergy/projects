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
                displayLabel.text = displayLabel.text! + userInput
            }
        }
    }
    
    @IBAction func calcBtnPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a double.")
        }
        
        if let actionBtn = sender.currentTitle {
            if actionBtn == "%" {
                displayLabel.text = String(number * 0.01)
            } else if actionBtn == "+/-" {
                displayLabel.text = String(number * -1)
            } else if actionBtn == "AC" {
                displayLabel.text = "0"
            }
        }
    }
}
