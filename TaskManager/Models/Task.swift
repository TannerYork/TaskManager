//
//  Task.swift
//  TaskManager
//
//  Created by Tanner York on 11/27/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
class Task {
    
    var title: String
    var description: String
    var priority: Int
    var completion: Bool = false
    var completionDate: Date?
    
    init(title: String, description: String, priority: Int, completionDate: Date?) {
        self.title = title
        self.description = description
        self.priority = priority
        self.completionDate = completionDate
        
        
        //Keeps the priority from gping over or below the limit
        if self.priority > 5 {
            self.priority = 5
        }
        if self.priority < 0 {
            self.priority = 0
        }
    }
    
}
