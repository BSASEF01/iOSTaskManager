//
//  taskManagerViewConttroller.swift
//  TaskManager
//
//  Created by Bersabeh Asefa on 5/17/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var TaskTitleTextField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    let completAndIncomplet = ["complet","Incomplet "]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func pickerView(_ pickView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return completAndIncomplet .count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return completAndIncomplet [row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView)-> Int {
        return 1
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        if (TaskTitleTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message: "please input a task title", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title:"okey!",style:.default))
            self.present(alert,animated: true)
            
        } else{
            var newTask = TaskClass()
            newTask.title = TaskTitleTextField.text!
            if pickerView.selectedRow(inComponent: 0) == 0 {
                newTask.completAndIncomplet = true
            } else {
                newTask.completAndIncomplet = false
            }
            TaskManager.sharedInstance.addTask(newTask)
            self.performSegue(withIdentifier: "unWindToTaskManager", sender: self)
        }
        
        
    }
    
    
}
