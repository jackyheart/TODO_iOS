//
//  ViewController.swift
//  Todo
//
//  Created by Jacky Tjoa on 17/4/21.
//  Copyright © 2021 Jacky Tjoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fbSource = FirebaseSource()
        viewModel = ViewModel(service: fbSource)
        viewModel.todoList.bind { [weak self] (todo) in
            self?.tableView.reloadData()
        }
    }
    
    @IBAction func addTapped(_ sender: Any) {
        viewModel.addItem(task: "Item")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        let todoList = viewModel.todoList.value
        let todo = todoList[indexPath.row]
        
        cell.textLabel?.text = todo.task
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let todoList = viewModel.todoList.value
            let todo = todoList[indexPath.row]
            viewModel.removeItem(id: todo.id)
        }
    }
}
