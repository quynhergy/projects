//
//  JokeTableViewController.swift
//  Joke Bank
//
//  Created by Quynh Nguyen on 6/14/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class JokeTableViewController: UITableViewController {
    
    var jokes = ["Chicken", "Doctor", "Lawyer"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    // Determine how many row to display
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }

    // Define what is displayed inside cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)
        let cell = UITableViewCell()
        cell.textLabel?.text = jokes[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedJoke = jokes[indexPath.row]
        performSegue(withIdentifier: "goToJoke", sender: selectedJoke)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        //let destinationVC = segue.destination as! JokeViewController
        if let jokeVC = segue.destination as? JokeViewController {
            
            if let selectedJoke = sender as? String {
                jokeVC.joke = selectedJoke
            }
            //if let indexPath = tableView.indexPathForSelectedRow?.item {
            //    jokeVC.title = jokes[indexPath]
            //}
        }
    }
}
