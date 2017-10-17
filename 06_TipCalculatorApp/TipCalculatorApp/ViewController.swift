//
//  ViewController.swift
//  TipCalculatorApp
//
//  Created by Julia on 2017/10/11.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var calclateTipButton: UIButton!
    @IBOutlet weak var tipAmountTextLabel: UILabel!
    
    @IBAction func calclateTip(_ sender: UIButton) {
        let bill = Double(billAmountTextField.text!)!
        let p = Double(tipPercentageTextField.text!)!
        tipAmountTextLabel.text = String(bill * (p/100.0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.keyboardType = UIKeyboardType.numberPad
        tipAmountTextLabel.text = ""
    }
}
