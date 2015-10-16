//
//  CustomTableViewCell.swift
//  Explore
//
//  Created by Alexander Demchenko on 08/10/15.
//  Copyright © 2015 Alexander Demchenko. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var imageViewAccessory: UIImageView!
    @IBOutlet weak var buttonDismiss: UIButton!
    @IBOutlet weak var constraintSeparatorLeading: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
