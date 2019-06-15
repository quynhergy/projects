//
//  ItemViewController.swift
//  ToDo List
//
//  Created by Quynh Nguyen on 6/15/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var importantToggle: UISwitch!
    
    var toDoListVC: ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        let newItem = ToDo()
        newItem.important = importantToggle.isOn
        if let itemText = newItemTextField.text {
            newItem.name = itemText
        }
        
        toDoListVC?.toDoList.append(newItem)
        toDoListVC?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
