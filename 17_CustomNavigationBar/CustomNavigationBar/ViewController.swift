//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Julia on 2017/11/24.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var navHeight: NSLayoutConstraint!
  @IBOutlet weak var plusButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
}

//UIView.animate(
//  withDuration: 2.0,
//  delay: 0.3,
//  usingSpringWithDamping: 0.0,
//  initialSpringVelocity: 0.0,
//  options: .curveEaseIn,
//  animations: {
//    if (self.navHeight.constant == 200) {
//      // Button
//      self.plusButton.transform = self.plusButton.transform.rotated(by: -CGFloat(Double.pi / 4))
//      // Nav height
//      self.navHeight.constant = 64
//    } else {
//      // Button
//      self.plusButton.transform = self.plusButton.transform.rotated(by: CGFloat(Double.pi / 4))
//      // Nav height
//      self.navHeight.constant = 200
//    }
//    self.loadViewIfNeeded()
//},
//  completion: nil)

//UIView.animate(withDuration: 2.0, delay: 0.3, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: .curveEaseIn, animations: {
//  if (self.navHeight.constant == 200) {
//    // Nav height
//    self.navHeight.constant = 64
//    print("close")
//  } else {
//    // Nav height
//    self.navHeight.constant = 200
//    print("open")
//  }
//
//}, completion: nil)
//self.loadViewIfNeeded()

