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
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  @IBAction func cancelButtonClicked(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func submitButtonClicked(_ sender: UIButton) {
    // TODO: Care emply case
    let todoTitle = titleTextField.text!
    let todoDescription = descriptionTextField.text!
    let todoPriority = priorityTextField.text!
    let todoCompleted = completedSwitch.isOn
    
    let todo = Todo(title: todoTitle, todoDescription: todoDescription, priprity: Int(todoPriority)!, isCompleted: todoCompleted)
    
    delegate.addTodo(todo)
  }
  
}

protocol AddTodoDelegate: class {
  func addTodo(_ todo: Todo)
}
