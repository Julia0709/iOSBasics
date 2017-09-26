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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaidgeckoCactus.cactus().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as? CactusTableViewCell
        
        let cactusData = PlaidgeckoCactus.cactus()[indexPath.row]
        
        cell?.textLabel?.text = cactusData.name
        cell?.detailTextLabel?.text = PlaidgeckoCactus.scaryFactorToString(scaryFactor: cactusData.howScary)
        cell?.imageView?.image = UIImage(named: cactusData.image)
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
