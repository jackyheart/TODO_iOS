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
    private let dbRef: DatabaseReference = Database.database().reference()
    private var dataList: Observable<[Todo]> = Observable(value: [])
    var counter = 0
    
    init() {
        //observe data change
        dbRef.observe(DataEventType.value) { [weak self] (snapshot) in
            if let snapshotVal = snapshot.value as? [String: Any] {
                var todos: [Todo] = []
                let keys = Array(snapshotVal.keys)
                for key in keys {
                    if var item = snapshotVal[key] as? [String: Any] {
                        item["id"] = key
                        let todo = Todo(dict: item)
                        todos.append(todo)
                    }
                }
                
                self?.dataList.value = todos
            }
        }
    }
    
    func getTodoList() -> Observable<[Todo]> {
        return dataList
    }
    
    func addItem(task: String) {
        counter += 1
        let todo = Todo(id: "\(counter)", task: task)
        
        //Can only store objects of type NSNumber, NSString, NSDictionary, and NSArray.
        dbRef.child("\(counter)").setValue(todo.toDictionary())
    }
    
    func removeItem(id: String) {
        
    }
}
