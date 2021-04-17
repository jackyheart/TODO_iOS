//
//  Observable.swift
//  Todo
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

class Observable<T> {
    
    private var callback: ((T) -> Void)?
    
    var value: T {
        didSet {
            callback?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> Void) {
        callback = completion
        completion(value)
    }
}
