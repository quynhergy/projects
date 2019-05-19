//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Quynh Nguyen on 5/5/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let magicBallArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    var randomBallNumber: Int = 0
    
    @IBOutlet weak var magicBall: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askBtnPressed(_ sender: Any) {
        newBallImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }
    
    func newBallImage() {
        randomBallNumber = Int.random(in: 0 ... 4)
        magicBall.image = UIImage(named: magicBallArray[randomBallNumber])
    }
    
}

