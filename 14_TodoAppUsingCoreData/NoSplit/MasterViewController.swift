//
//  MasterViewController.swift
//  NoSplit
//
//  Created by Derrick Park on 2017-06-13.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var todos = [Todo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTodo" {
            let controller = segue.destination as! AddTodoViewController
            controller.delegate = self
            controller.isEditMode = false
        } else if segue.identifier == "editTodo" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let todo = todos[indexPath.row]
                let controller = segue.destination as! AddTodoViewController
                controller.todo = todo
                controller.isEditMode = true
                controller.index = indexPath.row
                controller.delegate = self
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! TodoTableViewCell
        
        let todo = todos[indexPath.row]
        cell.titleLabel.text = todo.title
        cell.descriptionLabel.text = todo.todoDescription
        cell.completedLabel.text = todo.isCompleted ? "👌" : "🖕"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension MasterViewController: AddTodoDelegate {
    
    func addTodo(_ todo: Todo) {
        todos.append(todo)
        tableView.reloadData()
    }
    func editTodo(_ todo: Todo, at index: Int) {
        todos[index] = todo
        tableView.reloadData()
    }
}







