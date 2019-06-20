//
//  ViewController.swift
//  Calculator
//
//  Created by Quynh Nguyen on 6/10/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        
        if let userInput = sender.currentTitle {
            result = (result == "") ? userInput : (result + userInput)
            answerLabel.text = result
        }
    }
}

