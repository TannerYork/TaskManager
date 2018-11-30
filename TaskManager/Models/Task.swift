//
//  Task.swift
//  TaskManager
//
//  Created by Tanner York on 11/27/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
   @objc dynamic var title = ""
   @objc dynamic var details  = ""
   @objc dynamic var priority = 1
   @objc dynamic var completion = false
   @objc dynamic var completionDate: Date? = Date()
   @objc dynamic var taskID = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "taskID"
    }
}
