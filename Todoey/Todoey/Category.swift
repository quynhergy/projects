//
//  Category.swift
//  Todoey
//
//  Created by Quynh Nguyen on 6/9/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
