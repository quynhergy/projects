//
//  JokeViewController.swift
//  Joke Bank
//
//  Created by Quynh Nguyen on 6/14/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    @IBOutlet weak var jokeLabel: UILabel!
    
    var joke = Joke()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = joke.title
        jokeLabel.text = joke.text
    }
}
