//
//  ServiceProtocol.swift
//  Todo
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

protocol ServiceProtocol {
    func getTodoList() -> Observable<[Todo]>
    func addItem(task: String)
    func removeItem(id: String)
}
