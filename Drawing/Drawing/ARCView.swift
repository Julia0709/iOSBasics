//
//  ARCView.swift
//  Drawing
//
//  Created by Julia on 2017/11/08.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

@IBDesignable
class ARCView: UIView {

    @IBInspectable var arcViewBGColor: UIColor = UIColor.blue
    
    override func draw(_ rect: CGRect) {
        arcViewBGColor.setFill()
        UIRectFill(rect)
        
        // Path
        let path = UIBezierPath()
        let center = CGPoint(x: rect.width / 2, y: rect.height - 10)
        path.addArc(withCenter: center, radius: rect.width / 2 - 50, startAngle: 0, endAngle: .pi, clockwise: false)
        path.lineWidth = 3
        lineColor
    }
}
