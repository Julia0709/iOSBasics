//
//  ViewController.swift
//  TableView
//
//  Created by Julia on 2017/09/25.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var cactus = [PlaidgeckoCactus]()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setRightBarButton(editButtonItem, animated: true)
        cactus = PlaidgeckoCactus.cactus()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            for (index, item) in cactus.enumerated() {
                let indexPath = IndexPath(row: cactus.count, section: index)
//                tableView.insertRows(at: [indexPath], with: animated)
//            }
//            tableView.endUpdates()
            //tableView.setEditing(true, animated: true)
        } else {
            for (index, item) in cactus.enumerated() {
//                let indexPath = IndexPath(row: cactus.count, section: index)
//                tableView.deleteRows(at: [indexPath], with: animated)
            }
            //tableView.setEditing(false, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let adjustment = isEditing ? 1 : 0
        return cactus.count + adjustment
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as? CactusTableViewCell
        let cactusData = cactus[indexPath.row]
        
        if indexPath.row >= cactus.count && isEditing {
            cell?.textLabel?.text = "Add item"
            cell?.detailTextLabel?.text = nil
            cell?.imageView?.image = nil
        }
        
        cell?.textLabel?.text = cactusData.name
        cell?.detailTextLabel?.text = PlaidgeckoCactus.scaryFactorToString(scaryFactor: cactusData.howScary)
        cell?.imageView?.image = UIImage(named: cactusData.image)
        return cell!
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            cactus.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
