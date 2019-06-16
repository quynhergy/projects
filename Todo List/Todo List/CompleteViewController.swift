//
//  ItemViewController.swift
//  ToDo List
//
//  Created by Quynh Nguyen on 6/16/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    var toDoItem = ToDo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = toDoItem.isImportant()
    }
    
    @IBAction func completeBtnPressed(_ sender: Any) {
    }
}
