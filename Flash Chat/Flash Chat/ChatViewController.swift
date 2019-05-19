//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Quynh Nguyen on 5/11/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var messageTableView: UITableView!
    @IBOutlet var sendButton: UIButton!
    
    var messageArray: [Message] = [Message]()
    //var topButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set up delegate and dataSource
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTextField.delegate = self
        
        // Register MessageCell.xib file
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        // Set tapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        configureTableView()
        retrieveMessages()
        
        messageTableView.separatorStyle = .none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "egg")
        
        if cell.senderUsername.text == Auth.auth().currentUser?.email! {
            cell.avatarImageView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
        } else {
            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
        }
        
        return cell
    }
    
    // Declare tableViewTapped method
    // Adjust the height constraint when user tap text field
    @objc func tableViewTapped() {
        messageTextField.endEditing(true)
    }
    
    // Declare configureTableView method
    // Adjust cell based on height
    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            // Keyboard is 300, compose view is 50
            self.heightConstraint.constant = 350
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func logoutPressed(_ sender: AnyObject) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    
    @IBAction func sendBtnPressed(_ sender: AnyObject) {
        messageTextField.endEditing(true)
        
        messageTextField.isEnabled = false
        sendButton.isEnabled = false
        
        let messageDB = Database.database().reference().child("Messages")
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "MessageBody": messageTextField.text!]
        
        messageDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Message saved successfully")

            }
            
            self.messageTextField.isEnabled = true
            self.sendButton.isEnabled = true
            self.messageTextField.text = ""
            
        }
    }
    
    // Declare retrieveMessages
    func retrieveMessages() {
        let messageDB = Database.database().reference().child("Messages")
        
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            
            let newMessage = Message()
            newMessage.sender = sender
            newMessage.messageBody = text
            
            self.messageArray.append(newMessage)
            self.configureTableView()
            self.messageTableView.reloadData()
            
        }
    }
    

    

    

    

}
