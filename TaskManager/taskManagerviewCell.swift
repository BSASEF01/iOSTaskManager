//
//  taskmanagerViewcell.swift
//  TaskManager
//
//  Created by Bersabeh Asefa on 5/17/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import UIKit
import RealmSwift

class TaskableViewcell: UITableViewCell {
    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var complet: UILabel!
    @IBOutlet weak var Incomplet: UILabel!
    
    func setUpCell(task: TaskClass) {
        nameLable.text = task.title
        
        if task.complet {
            complet.text = "Avaliable"
            complet.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            Incomplet.text = "Not Avaliable"
            Incomplet.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    
    
    
    
    
}
