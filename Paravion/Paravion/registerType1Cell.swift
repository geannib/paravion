//
//  registerType1Cell.swift
//  Paravion
//
//  Created by Apple on 27/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class registerType1Cell: UITableViewCell {

    @IBOutlet  weak  var labelKind: UILabel!
    @IBOutlet weak var inputKind: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
