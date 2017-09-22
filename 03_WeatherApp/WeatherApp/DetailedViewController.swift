//
//  DetailedViewController.swift
//  WeatherApp
//
//  Created by Julia on 2017/09/21.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var cityName: String = ""
    
    func setCityName(cityName: String) {
        self.cityName = cityName
        showWeatherDetails(cityName: cityName)
    }

    func showWeatherDetails(cityName: String) {
        let cityNameLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: 120, width: 300, height: 80))
        cityNameLabel.textAlignment = NSTextAlignment.center
        cityNameLabel.font = UIFont.systemFont(ofSize: 36)
        cityNameLabel.textColor = UIColor.white
        cityNameLabel.text = cityName
        view.addSubview(cityNameLabel)
    }
}
