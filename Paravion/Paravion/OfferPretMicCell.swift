//
//  OfferPretMic.swift
//  Paravion
//
//  Created by Apple on 14/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class OfferPretMicCell: UITableViewCell {

    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var switchRight: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        switchRight.addTarget(self, action: #selector(OfferPretMicCell.switchValueDidChange(_:)), for: .valueChanged)
        labelLeft.text = "Oricand e pretul mai mic"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueDidChange(_ sender:UISwitch!) {
        
        print("OfferPretMicCell swich value changed")
    }

}
