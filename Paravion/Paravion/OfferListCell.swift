//
//  OfferListCell.swift
//  Paravion
//
//  Created by Apple on 11/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class OfferListCell: UITableViewCell {

    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageGreen: UIImageView!
    @IBOutlet weak var imageRed: UIImageView!
    @IBOutlet weak var labeltTop: UILabel!
    @IBOutlet weak var labelBottom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
