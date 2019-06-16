//
//  ItemViewController.swift
//  ToDo List
//
//  Created by Quynh Nguyen on 6/15/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit
import CoreData

class NewItemViewController: UIViewController {
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var importantToggle: UISwitch!
    
    var toDoListVC: ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDo(context: context)
            if let itemText = newItemTextField.text {
                newToDo.name = itemText
                newToDo.important = importantToggle.isOn
                newToDo.done = false
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
