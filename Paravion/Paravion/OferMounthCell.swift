//
//  OferMounthCell.swift
//  Paravion
//
//  Created by Apple on 14/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class OferMounthCell: UITableViewCell {

    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    @IBOutlet weak var viewLeft: UIView!
    @IBOutlet weak var viewRight: UIView!
    
    var cellId: NSInteger = 0
    let mounth = ["Ianuarie", "Februarie", "Martie", "Aprilie", "Mai",
                  "Iunie", "Iulie", "August", "Septembrie", "Octombrie",
                  "Noiembrie", "Decembrie"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewLeft.backgroundColor = UIColor.white
        viewRight.backgroundColor = UIColor.white
        
        
        // Initialization code
    }

    func setCellData(id: NSInteger){
        
        self.cellId = id;
        viewLeft.tag = cellId + 100
        viewRight.tag = cellId + 101
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(OfferPersonsCell.modifyClicked(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(OfferPersonsCell.modifyClicked(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        
        viewRight.addGestureRecognizer(tapGesture)
        viewRight.isUserInteractionEnabled = true
        viewLeft.addGestureRecognizer(tapGesture2)
        viewLeft.isUserInteractionEnabled = true
        
        let leftLabelTxt = mounth[cellId * 2]
        let rightLabelTxt = mounth[cellId * 2 + 1]
        
        labelLeft.text = leftLabelTxt
        labelRight.text = rightLabelTxt
    }
    func modifyClicked(_ sender: UITapGestureRecognizer) {
        
        let selectedTag = sender.view?.tag
        print("OferMounthCell view is: \(selectedTag ?? 3 )" )
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
