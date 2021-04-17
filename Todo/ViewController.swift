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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fbSource = FirebaseSource()
        viewModel = ViewModel(service: fbSource)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        viewModel.addItem(task: "Hello")
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
