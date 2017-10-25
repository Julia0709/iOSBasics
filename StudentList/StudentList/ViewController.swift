//
//  ViewController.swift
//  StudentList
//
//  Created by Julia on 2017/10/25.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var students: [NSManagedObject] = []
    
    @IBAction func addStudent(_ sender: UIBarButtonItem) {

        let alert = UIAlertController(title: "New Name", message: "Add a new student name", preferredStyle: .alert)

        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] aftion in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            self.save(name: nameToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

    // Func: Called when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Student List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // Func: Fetch data to my persistent store
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do {
            students = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    // Func: To save new added names
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Student", in: managedContext)!
        let student = NSManagedObject(entity: entity, insertInto: managedContext)
        student.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            students.append(student)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student = students[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Grab "name" attribute from "students" NSManagedObject
        cell.textLabel?.text = student.value(forKeyPath: "name") as? String
        return cell
    }
}
