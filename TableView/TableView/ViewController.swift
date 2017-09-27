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
        if editing {
            tableView.setEditing(true, animated: true)
        } else {
            tableView.setEditing(false, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cactus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as? CactusTableViewCell
        
        let cactusData = cactus[indexPath.row]
        
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
