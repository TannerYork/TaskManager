//
//  TaskTVC.swift
//  TaskManager
//
//  Created by Tanner York on 11/27/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class TaskTVC: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var taskImageView: UIImageView!
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskCompletion: UILabel!
    @IBOutlet weak var priority: UILabel!
    
    let formatter = Formatter()
        

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupCell(task: Task) {
        taskTitle.text = task.title
        if task.completionDate != nil {
            taskCompletion.text = formatter.formatStringFromDate(task.completionDate!)
            if task.completionDate! > Formatter.shared.date {
                taskCompletion.textColor = .darkRed
            } else {
                taskCompletion.textColor = .textBlue
            }
        } else {
            taskCompletion.textColor = .textBlue
            if task.completion == false {
                taskCompletion.text = "Not Complete"
            } else {
                taskCompletion.text = "Complete"
            }
        }
        
        if task.priority == 1 || task.priority == 2 {
            priority.backgroundColor = .navyGreen
        } else if task.priority == 3 || task.priority == 4 {
            priority.backgroundColor = .darkYellow
        } else if task.priority == 5 {
            priority.backgroundColor = .darkRed
        }
    }
    


    
}
