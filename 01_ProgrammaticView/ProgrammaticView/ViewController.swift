//
//  ViewController.swift
//  ProgrammaticView
//
//  Created by Derrick Park on 2017-05-24.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let framingView: UIView = UIView(frame: CGRect.zero)
    let squareButton: UIButton = UIButton(type: .system)
    let portraitButton: UIButton = UIButton(type: .system)
    let landscapeButton: UIButton = UIButton(type: .system)
    var framingViewHeightConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    var framingViewWidthConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    
    // Main elements
    var purpleView: UIView = UIView(frame: CGRect.zero)
    var blueView1: UIView = UIView(frame: CGRect.zero)
    var blueView2: UIView = UIView(frame: CGRect.zero)
    var blueView3: UIView = UIView(frame: CGRect.zero)
    var redView: UIView = UIView(frame: CGRect.zero)
    var orangeLeftView: UIView = UIView(frame: CGRect.zero)
    var orangeRightView: UIView = UIView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squareButton.setTitle("Square", for: .normal)
        squareButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(squareButton)
        squareButton.translatesAutoresizingMaskIntoConstraints = false
        
        portraitButton.setTitle("Portrait", for: .normal)
        portraitButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(portraitButton)
        portraitButton.translatesAutoresizingMaskIntoConstraints = false
        
        landscapeButton.setTitle("Landscape", for: .normal)
        landscapeButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(landscapeButton)
        landscapeButton.translatesAutoresizingMaskIntoConstraints = false
        
        framingView.translatesAutoresizingMaskIntoConstraints = false
        framingView.backgroundColor = UIColor.green
        view.addSubview(framingView)
        
        let buttonsHorizontalContraintsFormat = "|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|"
        
        let buttonsHorizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: buttonsHorizontalContraintsFormat, options: .alignAllCenterY, metrics: nil, views: ["squareButton":squareButton, "portraitButton":portraitButton, "landscapeButton":landscapeButton])
        
        NSLayoutConstraint.activate(buttonsHorizontalContraints)
        
        let squareButtonBottomConstraint = NSLayoutConstraint.init(item: squareButton,
                                                                   attribute: .bottom,
                                                                   relatedBy: .equal,
                                                                   toItem: view,
                                                                   attribute: .bottom,
                                                                   multiplier: 1.0,
                                                                   constant: -50.0)
        squareButtonBottomConstraint.isActive = true
        
        let framingViewCenterXContraint = NSLayoutConstraint.init(item: framingView,
                                                                  attribute: .centerX,
                                                                  relatedBy: .equal,
                                                                  toItem: view,
                                                                  attribute: .centerX,
                                                                  multiplier: 1.0,
                                                                  constant: 0.0)
        framingViewCenterXContraint.isActive = true

        let framingViewCenterYContraint = NSLayoutConstraint.init(item: framingView,
                                                                  attribute: .centerY,
                                                                  relatedBy: .equal,
                                                                  toItem: view,
                                                                  attribute: .centerY,
                                                                  multiplier: 1.0,
                                                                  constant: 0.0)
        framingViewCenterYContraint.isActive = true
        
        framingViewHeightConstraint = NSLayoutConstraint.init(item: framingView,
                                                              attribute: .height,
                                                              relatedBy: .equal,
                                                              toItem: nil,
                                                              attribute: .notAnAttribute,
                                                              multiplier: 1.0,
                                                              constant: 500.0)
        framingViewHeightConstraint.isActive = true
        
        framingViewWidthConstraint = NSLayoutConstraint.init(item: framingView,
                                                             attribute: .width,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: 500.0)
        framingViewWidthConstraint.isActive = true

        // Main elements settings
        purpleView.backgroundColor = UIColor.purple
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(purpleView)

        blueView1.backgroundColor = UIColor.blue
        blueView1.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(blueView1)

        blueView2.backgroundColor = UIColor.blue
        blueView2.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(blueView2)

        blueView3.backgroundColor = UIColor.blue
        blueView3.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(blueView3)

        redView.backgroundColor = UIColor.red
        redView.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(redView)

        orangeLeftView.backgroundColor = UIColor.orange
        orangeLeftView.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(orangeLeftView)

        orangeRightView.backgroundColor = UIColor.orange
        orangeRightView.translatesAutoresizingMaskIntoConstraints = false
        framingView.addSubview(orangeRightView)
    }
    
    // Constrain settings
    override func viewDidLayoutSubviews() {
        // purpleView
        NSLayoutConstraint.init(item: purpleView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .bottom,
                                multiplier: 1.0,
                                constant: -20.0).isActive = true

        NSLayoutConstraint.init(item: purpleView,
                                attribute: .right,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .right,
                                multiplier: 1.0,
                                constant: -20.0).isActive = true

        NSLayoutConstraint.init(item: purpleView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true

        NSLayoutConstraint.init(item: purpleView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .width,
                                multiplier: 0.61,
                                constant: -20.0).isActive = true

        // blueView1
        NSLayoutConstraint.init(item: blueView1,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: blueView2,
                                attribute: .top,
                                multiplier: 1.0,
                                constant: -40.0).isActive = true

        NSLayoutConstraint.init(item: blueView1,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .centerX,
                                multiplier: 1.0,
                                constant: 0.0).isActive = true

        NSLayoutConstraint.init(item: blueView1,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true

        NSLayoutConstraint.init(item: blueView1,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true

        // blueView2
        NSLayoutConstraint.init(item: blueView2,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .centerX,
                                multiplier: 1.0,
                                constant: 0.0).isActive = true

        NSLayoutConstraint.init(item: blueView2,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .centerY,
                                multiplier: 1.0,
                                constant: 0.0).isActive = true

        NSLayoutConstraint.init(item: blueView2,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true

        NSLayoutConstraint.init(item: blueView2,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true

        // blueView3
        NSLayoutConstraint.init(item: blueView3,
                                attribute: .top,
                                relatedBy: .equal,
                                toItem: blueView2,
                                attribute: .bottom,
                                multiplier: 1.0,
                                constant: 40.0).isActive = true

        NSLayoutConstraint.init(item: blueView3,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .centerX,
                                multiplier: 1.0,
                                constant: 0.0).isActive = true

        NSLayoutConstraint.init(item: blueView3,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true

        NSLayoutConstraint.init(item: blueView3,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true

        // redView
        NSLayoutConstraint.init(item: redView,
                                attribute: .top,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .top,
                                multiplier: 1.0,
                                constant: 20.0).isActive = true

        NSLayoutConstraint.init(item: redView,
                                attribute: .right,
                                relatedBy: .equal,
                                toItem: framingView,
                                attribute: .right,
                                multiplier: 1.0,
                                constant: -20.0).isActive = true

        NSLayoutConstraint.init(item: redView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true

        NSLayoutConstraint.init(item: redView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 150.0).isActive = true

        // orangeLeftView
        NSLayoutConstraint.init(item: orangeLeftView,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: redView,
                                attribute: .centerY,
                                multiplier: 1.0,
                                constant: 0.0).isActive = true

        NSLayoutConstraint.init(item: orangeLeftView,
                                attribute: .right,
                                relatedBy: .equal,
                                toItem: orangeRightView,
                                attribute: .left,
                                multiplier: 1.0,
                                constant: -10.0).isActive = true
        
        NSLayoutConstraint.init(item: orangeLeftView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 30.0).isActive = true
        
        NSLayoutConstraint.init(item: orangeLeftView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 70.0).isActive = true

        // orangeRightView
        NSLayoutConstraint.init(item: orangeRightView,
                                attribute: .right,
                                relatedBy: .equal,
                                toItem: redView,
                                attribute: .right,
                                multiplier: 1.0,
                                constant: -10.0).isActive = true

        NSLayoutConstraint.init(item: orangeRightView,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: redView,
                                attribute: .centerY,
                                multiplier: 1.0,
                                constant: 0.0).isActive = true

        NSLayoutConstraint.init(item: orangeRightView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 30.0).isActive = true
        
        NSLayoutConstraint.init(item: orangeRightView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .notAnAttribute,
                                multiplier: 1.0,
                                constant: 50.0).isActive = true
    }

    func resizeFramingView(_ sender: UIButton) {
        var newWidth: CGFloat = 0.0
        var newHeight: CGFloat = 0.0
        if (sender == self.squareButton) {
            newWidth = 500.0
            newHeight = 500.0
        } else if (sender == self.portraitButton) {
            newWidth = 350.0
            newHeight = 550.0
        } else if (sender == self.landscapeButton) {
            newWidth = 900.0
            newHeight = 300.0
        }
        
        UIView.animate(withDuration: 2.0) {
            self.framingViewHeightConstraint.constant = newHeight
            self.framingViewWidthConstraint.constant = newWidth
            self.view.layoutIfNeeded()
        }
    }
}

