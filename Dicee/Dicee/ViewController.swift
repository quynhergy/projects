//
//  ViewController.swift
//  Dicee
//
//  Created by Quynh Nguyen on 5/5/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    var randomDice1: Int = 0
    var randomDice2: Int = 0
    
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func RollBtnPressed(_ sender: Any) {
        updateDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDice()
    }
    
    func updateDice() {
        randomDice1 = Int.random(in: 0 ... 5)
        randomDice2 = Int.random(in: 0 ... 5)
        
        dice1.image = UIImage(named: diceArray[randomDice1])
        dice2.image = UIImage(named: diceArray[randomDice2])
    }
}

