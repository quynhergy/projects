//
//  ItemViewController.swift
//  ToDo List
//
//  Created by Quynh Nguyen on 6/16/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var toDo : ToDo? = nil
    
    //var toDo = ToDo(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDo {
            nameLabel.text = toDo.important ? "❗️" + toDo.name! : toDo.name
        }
    }
    
    @IBAction func completeBtnPressed(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDo = toDo {
                context.delete(toDo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
}
