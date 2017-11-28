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
    self.navigationItem.leftBarButtonItem = self.editButtonItem
  }
  
  override func viewWillAppear(_ animated: Bool) {
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
//  func insertNewObject(sender: AnyObject) {
//    let todo = Todo(title: "Test", todoDescription: "This is a test.", priprity: 1, isCompleted: false)
//    todos.insert(todo, at: 0)
//    let indexPath = NSIndexPath(row: 0, section: 0)
//    self.tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
//  }
  
  // MARK: - Segues
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let todo = todos[indexPath.row]
        let controller = segue.destination as! DetailViewController
        controller.todoItem = todo
      }
    } else if segue.identifier == "addTodo" {
      let controller = segue.destination as! AddTodoViewController
      controller.delegate = self
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
    cell.textLabel!.text = todo.title
    cell.descriptionLabel.text = todo.todoDescription
    cell.completedLabel.text = todo.isCompleted ? "✅" : "☑️"
    
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
}


