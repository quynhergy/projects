//
//  JokeViewController.swift
//  Joke Bank
//
//  Created by Quynh Nguyen on 6/14/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    var joke = ""
    @IBOutlet weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = joke
        
        if joke == "Chicken" {
            jokeLabel.text = "Q: Why did the chicken cross the road?\n\nA: To get to the other side"
        }
        
        if joke == "Doctor" {
            jokeLabel.text = "Doctor: \"I'm sorry but you suffer from a terminal illness and have only 10 to live.\"\n\nPatient: \"What do you mean, 10? 10 what? Months? Weeks?!\"\n\nDoctor: \"Nine.\""
        }
        
        if joke == "Lawyer" {
            jokeLabel.text = "I got another letter from this lawyer today. It said \"Final Notice\". Good that he will not bother me anymore."
        }
    }
}
