//
//  AddTaskVC.swift
//  TaskManager
//
//  Created by Tanner York on 11/27/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController {

    //MARK: Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    @IBOutlet weak var prioritySegmentControl: UISegmentedControl!
    var priority: Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupValues.shared.backgroundColor
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
        // Do any additional setup after loading the view.
    }
    
    //MARK: Acitions
    
    //Changes priority based on segment control
    @IBAction func indexChanged(_ sender: Any) {
        
        switch prioritySegmentControl.selectedSegmentIndex {
        case 0:
            priority = 1
        case 1:
            priority = 2
        case 2:
            priority = 3
        case 3:
            priority = 4
        case 4:
            priority = 5
        default:
            return
        }
    }
    
    
    
    
    @IBAction func addTask(_ sender: Any) {
        guard let title = titleTextField.text, titleTextField.text != "", 
              let details = detailsTextView.text,
              let date = Formatter.shared.formatStringFromDate(dateDatePicker.date) else {
                taskCreationError()
                return
        }
        let formattedDate = Formatter.shared.formatDateFromString(date)
        
        let newTask = Task(title: title, description: details, priority: priority, completionDate: formattedDate)
        SetupValues.shared.tasks.append(newTask)
        navigationController?.popViewController(animated: true)
    }
    

}
