//
//  ViewModel.swift
//  Todo
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

class ViewModel {
    
    let service: ServiceProtocol
    var todoList: Observable<[Todo]> = Observable(value: [])
    
    init(service: ServiceProtocol) {
        self.service = service

        //listen to changes
        service.getTodoList().bind { [weak self] (todos) in
            self?.todoList.value = todos
        }
    }
        
    func addItem(task: String) {
        service.addItem(task: task)
    }
    
    func removeItem(id: String) {
        service.removeItem(id: id)
    }
}
