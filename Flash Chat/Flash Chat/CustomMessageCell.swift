//
//  CustomMessageCell.swift
//  Flash Chat
//
//  Created by Quynh Nguyen on 5/11/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit

class CustomMessageCell: UITableViewCell {
    
    @IBOutlet var messageBackground: UIView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var messageBody: UILabel!
    @IBOutlet var senderUsername: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
