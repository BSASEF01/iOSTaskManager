//
//  ViewController.swift
//  TaskManager
//
//  Created by Bersabeh Asefa on 5/17/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection selction: Int) -> Int {
        
        return TaskManager.sharedInstance.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskableViewcell
        cell.setUpCell(task:TaskManager.sharedInstance.getTask(index: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(_tableView:UITableView,editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        let Task = TaskManager.sharedInstance.getTask(index: indexPath.row)
        let title = Task.complet
        
        let complat = UITableViewRowAction(style: .normal, title: Task.title) {(_,_) in
            let cellForIndex = self.tableView.cellForRow(at: indexPath) as! TaskableViewcell
            TaskManager.sharedInstance
          
            self.tableView.reloadData()
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") {(_,_) in
            TaskManager.sharedInstance.removeTask(Task)
            self.tableView.deleteRows(at:[indexPath], with: .fade)
            self.tableView.reloadData()
            
            
        }
        
        
        
        return[deleteAction,deleteAction]
        
    }
    
      @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
}
