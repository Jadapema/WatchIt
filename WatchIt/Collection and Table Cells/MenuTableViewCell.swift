//
//  MenuTableViewCell.swift
//  WatchIt
//
//  Created by Celina Martinez on 31/1/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var selectedSign: UIView!
    @IBOutlet weak var categoryName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
