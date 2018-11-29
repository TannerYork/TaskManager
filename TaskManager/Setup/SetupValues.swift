//
//  Background:Text Color.swift
//  TaskManager
//
//  Created by Tanner York on 11/26/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import UIKit



class SetupValues: NSObject {
   static let shared = SetupValues()

    
    //Value for global background color
    @objc dynamic var backgroundColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
    var backgroundRedValue = 0.14
    var backgroundBlueValue = 0.14
    var backgroundGreenValue = 0.14
    
    //Arrays for task storaged based on completion
    var tasks: [Task] = []
    var tasksCompleted: [Task] = []
    var tasksNotCompleted: [Task] = []
    
    
    func fillTask() {
        //Gets saved realms data for tasks and populate tasks array
        
    }
    
    func fillCompleted() {
        //Run through task array and find completed task. Then appended them to the taskCompleted array
        for task in tasks {
            if task.completion == true {
                tasksCompleted.append(task)
            }
        }
    }
    
    func fillNotCompleted() {
        //Run through task array and find task notCompleted. Then appened them to the taskNotCompleted array
        for task in tasks {
            if task.completion == false {
                tasksNotCompleted.append(task)
            }
        }
    }

    
    
    
}
