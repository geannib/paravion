//
//  TutorialTitleCell.swift
//  Paravion
//
//  Created by Apple on 09/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class TutorialTitleCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        self.labelTitle.text = "Cum Calatoresti?"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
