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
        
        if currentToDo.important == true {
            cell.textLabel?.text = "❗️ " + currentToDo.name
        } else {
            cell.textLabel?.text = currentToDo.name
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ItemViewController {
            destinationVC.toDoListVC = self
        }
    }
}
