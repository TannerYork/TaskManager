//
//  DetailsVC.swift
//  TaskManager
//
//  Created by Tanner York on 11/27/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var taskTitle: String?
    var taskDetails: String?
    var taskDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupValues.shared.backgroundColor
        titleLabel.text = taskTitle
        detailsTextView.text = taskDetails
        dateLabel.text = taskDate
    }
    
    //MARK: Actions
    
    //Sets up the view based on the task its given 
    func setupView(_ task: Task) {
        taskTitle = task.title
        taskDetails = task.details
        if task.completionDate != nil {
            taskDate = Formatter.shared.formatStringFromDate(task.completionDate!)
        } else {
            if task.completion == false {
                taskDate = "Not Complete"
            } else {
                taskDate = "Complete"
            }
        }
    }
    
}
