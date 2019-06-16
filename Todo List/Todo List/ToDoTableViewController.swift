//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Quynh Nguyen on 6/15/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDoList = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.reloadData()
        print(toDoList)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return toDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let currentToDo = toDoList[indexPath.row]
        cell.textLabel?.text = currentToDo.isImportant()

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? NewItemViewController {
            createVC.toDoListVC = self
        }
        if let completeVC = segue.destination as? CompleteViewController {
            if let selectedToDo = sender as? ToDo {
                completeVC.toDoItem = selectedToDo
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = toDoList[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedTodo)
        
    }
}
