//
//  SectionHeaderView.swift
//  NationalParks
//
//  Created by Derrick Park on 2017-10-02.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
