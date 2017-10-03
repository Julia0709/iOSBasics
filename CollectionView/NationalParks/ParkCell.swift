//
//  ParkCell.swift
//  NationalParks
//
//  Created by Derrick Park on 2017-10-02.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ParkCell: UICollectionViewCell {
    @IBOutlet weak var parkImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func prepareForReuse() {
        parkImageView.image = nil
        captionLabel.text = ""
    }
    
    var park: Park? {
        didSet {
            if let nationalPark = park {
                parkImageView.image = UIImage(named: nationalPark.photo)
                captionLabel.text = nationalPark.photo
            }
        }
    }
    
}
