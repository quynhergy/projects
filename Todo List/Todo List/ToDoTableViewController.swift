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
        
        let item1 = ToDo()
        item1.name = "Buy Eggs"
        let item2 = ToDo()
        item2.name = "Walk Dogs"
        let item3 = ToDo()
        item3.name = "Drink Milk"
        toDoList = [item1, item2, item3]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return toDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row].name

        return cell
    }
}
