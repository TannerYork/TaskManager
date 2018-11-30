//
//  RealmsManager.swift
//  TaskManager
//
//  Created by Tanner York on 11/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import RealmSwift

class RealmsManager {
    private var realm: Realm
    static let   sharedInstance = RealmsManager()
    
    private init() {
        realm = try! Realm()
    }
    
    func getDataFromRealm() ->   Results<Task> {
        let results: Results<Task> = realm.objects(Task.self)
        return results
    }
    
    func addData(object: Task)   {
        try! realm.write {
            realm.add(object, update: true)
            print("Added new object")
        }
    }
    
    func deleteAllFromDatabase()  {
        try!   realm.write {
            realm.deleteAll()
        }
    }
    
    func deleteFromRealm(object: Task)   {
        try! realm.write {
            realm.delete(object)
        }
    }
}
