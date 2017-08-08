//
//  tutorialOptionCell.swift
//  Paravion
//
//  Created by Apple on 09/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class tutorialOptionCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageLeft:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        self.labelTitle.text = "Singur"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
