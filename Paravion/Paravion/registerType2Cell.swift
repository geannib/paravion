//
//  registerType2Cell.swift
//  Paravion
//
//  Created by Apple on 27/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit


class registerType2Cell: UITableViewCell {

    @IBOutlet  weak  var labelKind: UILabel!
    @IBOutlet weak var viewMale: UIView!
    @IBOutlet weak var viewFemale: UIView!
    @IBOutlet weak var imageFemale: UIImageView!
    @IBOutlet weak var labelFemale: UILabel!
    @IBOutlet weak var imageMale: UIImageView!
    @IBOutlet weak var labelMale: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewMale.backgroundColor = UIColor.clear
        self.viewFemale.backgroundColor = UIColor.clear
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
