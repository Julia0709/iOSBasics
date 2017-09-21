//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Derrick Park on 2017-05-26.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

// Enable hex color code
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

let BG_COLOR = UIColor(rgb: 0x4E92DF)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabBarController = UITabBarController()
        
        let city1VC = ViewController()
        city1VC.title = "Vancouver"
        city1VC.view.backgroundColor = BG_COLOR
        
        let city2VC = ViewController()
        city2VC.title = "city2"
        city2VC.view.backgroundColor = BG_COLOR
        
        let city3VC = ViewController()
        city3VC.title = "city3"
        city3VC.view.backgroundColor = BG_COLOR

        let city4VC = ViewController()
        city4VC.title = "city4"
        city4VC.view.backgroundColor = BG_COLOR
        
        city1VC.tabBarItem = UITabBarItem(title: "city1", image: UIImage(named: "clear-night"), tag: 0)
        city2VC.tabBarItem = UITabBarItem(title: "city2", image: UIImage(named: "clear-night"), tag: 1)
        city3VC.tabBarItem = UITabBarItem(title: "city3", image: UIImage(named: "clear-night"), tag: 2)
        city4VC.tabBarItem = UITabBarItem(title: "city4", image: UIImage(named: "clear-night"), tag: 3)
        
        let controllers = [city1VC, city2VC, city3VC, city4VC]
        
        tabBarController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController

        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
