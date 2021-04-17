//
//  ViewModel.swift
//  Todo
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

class ViewModel {
    
    let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func getTodoList() -> [Todo] {
        return service.getTodoList()
    }
    
    func addItem(task: String) {
        service.addItem(task: task)
    }
    
    func removeItem(id: String) {
        service.removeItem(id: id)
    }
}
