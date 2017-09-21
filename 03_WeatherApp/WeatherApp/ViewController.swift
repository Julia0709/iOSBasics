//
//  ViewController.swift
//  WeatherApp
//
//  Created by Derrick Park on 2017-05-26.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        
        let button = UIButton(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    func pushToNextVC(){
        let newVC = UIViewController()
        newVC.view.backgroundColor = UIColor.red
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
