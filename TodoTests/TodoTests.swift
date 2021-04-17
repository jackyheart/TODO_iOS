//
//  TodoTests.swift
//  TodoTests
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

import XCTest
@testable import Todo

class TodoTests: XCTestCase {
    
    var sut: ViewModel!
    let mockService = MockService()
    
    class MockService: ServiceProtocol {
        var isGetTodoListCalled = false
        var isAddItemCalled = false
        var isRemoveItemCalled = false
        
        func getTodoList() -> Observable<[Todo]> {
            isGetTodoListCalled = true
            return Observable(value: [])
        }
        
        func addItem(task: String) {
            isAddItemCalled = true
        }
        
        func removeItem(id: String) {
            isRemoveItemCalled = true
        }
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ViewModel(service: mockService)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testIsGetToDoListCalled() {
        XCTAssertTrue(mockService.isGetTodoListCalled)
    }

    func testIsAddItemCalled() {
        sut.addItem(task: "My Task")
        XCTAssertTrue(mockService.isAddItemCalled)
    }
    
    func testIsRemoveItemCalled() {
        sut.removeItem(id: "SomeId")
        XCTAssertTrue(mockService.isRemoveItemCalled)
    }
}
