//
//  FirebaseSource.swift
//  Todo
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseSource: ServiceProtocol {
    let dbRef: DatabaseReference = Database.database().reference()
    
    func getTodoList() -> [Todo] {
        return []
    }
    
    func addItem(task: String) {
        let todo = Todo(task: task, time: Date())
        
        //Can only store objects of type NSNumber, NSString, NSDictionary, and NSArray.
        dbRef.setValue(todo.asDictionary())
    }
    
    func removeItem(id: String) {
        
    }
}
