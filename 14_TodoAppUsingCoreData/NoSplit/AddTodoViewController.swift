//
//  AddTodoViewController.swift
//  NoSplit
//
//  Created by Derrick on 2017-11-27.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTestField: UITextField!
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
            titleTestField?.text = todo.title
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
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        guard let isEdit = isEditMode else { return }
        if isEdit {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
        
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        // TODO : handle empty fields
        let todoTitle = titleTestField.text!
        let todoDesc = descriptionTextField.text!
        let todoPriority = priorityTextField.text!
        let todoCompleted = completedSwitch.isOn
        
        let todo = Todo(title: todoTitle, todoDescription: todoDesc, priority: Int(todoPriority)!, isCompleted: todoCompleted)
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




