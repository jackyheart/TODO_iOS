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
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //configure UI elements
        btnAdd.layer.cornerRadius = btnAdd.bounds.width * 0.5
        btnAdd.layer.masksToBounds = true
        btnAdd.backgroundColor = self.view.tintColor
        btnAdd.setTitle("+", for: .normal)
        btnAdd.setTitleColor(.white, for: .normal)
        btnAdd.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        
        //view binding
        let fbSource = FirebaseSource()
        viewModel = ViewModel(service: fbSource)
        viewModel.todoList.bind { [weak self] (todo) in
            self?.tableView.reloadData()
        }
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Todo", message: "Add a To-do Item", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "To-do Item"
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert, weak self] (_) in
            if let textField = alert?.textFields?.first {
                if let text = textField.text, !text.isEmpty {
                    self?.viewModel.addItem(task: text)
                }
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
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
