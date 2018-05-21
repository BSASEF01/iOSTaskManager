//
//  taskManager.swift
//  TaskManager
//
//  Created by Bersabeh Asefa on 5/17/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import Foundation
import RealmSwift


class TaskManager {
    
    static let sharedInstance = TaskManager()
    
    var tasks: Results<TaskClass>!
    private init() {
        tasks = realm.objects(TaskClass.self)
        
    }
    
    let realm = try! Realm()
    
    let calendar = Calendar.current
    
    
    
    func addTask(_ tasks: TaskClass) {
        try! realm.write {
            realm.add(tasks)
        }
    }
    
    func removeTask(_ task: TaskClass) {
        try! realm.write {
            realm.delete(task)
        }
    }
    
    func getTask(index: Int) -> TaskClass {
        return tasks[index]
    }
    
    func  getTaskCount() -> Int {
        return tasks.count
    }
    
    func checkInOrOut(task:TaskClass) {
        try! realm.write {
            if task.complet  {
                task.dueDate = calendar.date(byAdding: .day, value: 3,to: Date())!
            } else {
                
                task.Incomplet = false
                task.dueDate = Date()
            }
        }
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
}
