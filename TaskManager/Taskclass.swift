//
//  taskClass.swift
//  TaskManager
//
//  Created by Bersabeh Asefa on 5/17/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import UIKit
import RealmSwift

class TaskClass: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic  var dueDate: Date = Date()
    @objc dynamic var completAndIncomplet = true
    @objc dynamic var complet = true
    @objc dynamic var Incomplet = true

    
}

