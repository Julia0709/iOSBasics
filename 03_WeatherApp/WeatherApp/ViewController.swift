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

        let textView = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: 120, width: 300, height: 80))
        textView.textAlignment = NSTextAlignment.center
        textView.font = UIFont.systemFont(ofSize: 36)
        textView.textColor = UIColor.white
        textView.text = "Vancouver"
        view.addSubview(textView)

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

class CityViewController: UIViewController {
    func displayContents() {

    }
}
