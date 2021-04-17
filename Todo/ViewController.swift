//
//  ViewController.swift
//  Todo
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel: ViewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTodoList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        let todoList = viewModel.getTodoList()
        let todo = todoList[indexPath.row]
        
        cell.textLabel?.text = todo.task
        
        return cell
    }
}
