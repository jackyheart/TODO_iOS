//
//  Todo.swift
//  Todo
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

import Foundation

struct Todo {
    var id: String
    var task: String
    
    func toDictionary() -> [String: Any] {
        return ["task": task]
    }
}

extension Todo {
    init(dict: [String: Any]) {
        id = (dict["id"] as? String) ?? ""
        task = (dict["task"] as? String) ?? ""
    }
}
