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

        let cityName = "City Name"
        let cityNameLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: 120, width: 300, height: 80))
        cityNameLabel.textAlignment = NSTextAlignment.center
        cityNameLabel.font = UIFont.systemFont(ofSize: 36)
        cityNameLabel.textColor = UIColor.white
        cityNameLabel.text = cityName
        view.addSubview(cityNameLabel)

        let temp = "  20˚"
        let tempLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: 200, width: 300, height: 80))
        tempLabel.textAlignment = NSTextAlignment.center
        tempLabel.font = UIFont.systemFont(ofSize: 72)
        tempLabel.textColor = UIColor.white
        tempLabel.text = temp
        view.addSubview(tempLabel)

        let weather = "Clear night"
        let weatherLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: 280, width: 300, height: 60))
        weatherLabel.textAlignment = NSTextAlignment.center
        weatherLabel.font = UIFont.systemFont(ofSize: 18)
        weatherLabel.textColor = UIColor.white
        weatherLabel.text = weather
        view.addSubview(weatherLabel)

//        let dvc = DetailedViewController()
//        dvc.showWeatherDetails(cityName: cityName)
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
