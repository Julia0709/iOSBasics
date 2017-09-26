//
//  CastomTableViewCell.swift
//  TableView
//
//  Created by Julia on 2017/09/25.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class CactusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
