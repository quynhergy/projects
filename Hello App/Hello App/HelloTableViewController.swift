//
//  TableViewController.swift
//  Hello App
//
//  Created by Quynh Nguyen on 6/16/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class HelloTableViewController: UITableViewController {
    var helloArray = [Hello]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadHello()
    }
    
    @IBAction func helloTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let _ = Hello(context: context)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        loadHello()
    }
    
    func loadHello() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            do {
                helloArray = try context.fetch(Hello.fetchRequest())
            } catch {
                print("Error fetching data")
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return helloArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = helloArray[indexPath.row].text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            context.delete(helloArray[indexPath.row])
            
        }
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        loadHello()
    }
}
