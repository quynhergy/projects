//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Quynh Nguyen on 5/11/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                print("Registration Successful")
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
            }
        }
        
    }
    
}
