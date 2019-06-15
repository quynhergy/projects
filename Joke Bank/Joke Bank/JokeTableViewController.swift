//
//  JokeTableViewController.swift
//  Joke Bank
//
//  Created by Quynh Nguyen on 6/14/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class JokeTableViewController: UITableViewController{
    
    var jokes: [Joke] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let joke1 = Joke()
        joke1.title = "Chicken"
        joke1.text = "Q: Why did the chicken cross the road?\n\nA: To get to the other side"
        
        let joke2 = Joke()
        joke2.title = "Doctor"
        joke2.text = "Doctor: \"I'm sorry but you suffer from a terminal illness and have only 10 to live.\"\n\nPatient: \"What do you mean, 10? 10 what? Months? Weeks?!\"\n\nDoctor: \"Nine.\""
        
        let joke3 = Joke()
        joke3.title = "Lawyer"
        joke3.text = "I got another letter from this lawyer today. It said \"Final Notice\". Good that he will not bother me anymore."
        
        jokes = [joke1, joke2, joke3]
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
        cell.textLabel?.text = jokes[indexPath.row].title

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
            
            if let selectedJoke = sender as? Joke {
                jokeVC.joke = selectedJoke
            }
        }
    }
}
