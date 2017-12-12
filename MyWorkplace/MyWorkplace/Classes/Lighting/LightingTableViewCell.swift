//
//  LightingTableViewCell.swift
//  MyWorkplace
//
//  Created by Gayatri Nagarkar on 23/10/17.
//  Copyright © 2017 JCI. All rights reserved.
//

import UIKit

class LightingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var lightOnOffSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        self.photoImageView.layer.cornerRadius = self.photoImageView.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
