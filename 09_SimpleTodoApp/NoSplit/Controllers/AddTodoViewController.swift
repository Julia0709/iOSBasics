//
//  AddTodoViewController.swift
//  NoSplit
//
//  Created by Julia on 2017/11/27.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var descriptionTextField: UITextField!
  @IBOutlet weak var priorityTextField: UITextField!
  @IBOutlet weak var completedSwitch: UISwitch!
  @IBOutlet weak var submitButton: UIButton!
  
  weak var delegate: AddTodoDelegate!
  var todo: Todo?
  var index: Int?
  var isEditMode: Bool?
  
  override func viewWillAppear(_ animated: Bool) {
    if let todo = todo {
      titleTextField?.text = todo.title
      descriptionTextField?.text = todo.todoDescription
      priorityTextField?.text = String(describing: todo.priority)
      completedSwitch?.isOn = (todo.isCompleted)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  @IBAction func cancelButtonClicked(_ sender: UIButton) {
    guard let isEdit = isEditMode else { return }
    if isEdit {
      navigationController?.popViewController(animated: true)
    } else {
      dismiss(animated: true, completion: nil)
    }
  }
  
  @IBAction func submitButtonClicked(_ sender: UIButton) {
    // TODO: Care emply case
    let todoTitle = titleTextField.text!
    let todoDescription = descriptionTextField.text!
    let todoPriority = priorityTextField.text!
    let todoCompleted = completedSwitch.isOn
    
    let todo = Todo(title: todoTitle, todoDescription: todoDescription, priority: Int(todoPriority)!, isCompleted: todoCompleted)
    
    guard let isEdit = isEditMode else { return }
    if isEdit {
      guard let index = index else { return }
      delegate.editTodo(todo, at: index)
      navigationController?.popViewController(animated: true)
    } else {
      delegate.addTodo(todo)
      dismiss(animated: true, completion: nil)
    }

  }
}

protocol AddTodoDelegate: class {
  func addTodo(_ todo: Todo)
  func editTodo(_ todo: Todo, at index: Int)
}
