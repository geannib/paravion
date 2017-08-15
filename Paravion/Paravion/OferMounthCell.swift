//
//  OferMounthCell.swift
//  Paravion
//
//  Created by Apple on 14/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

protocol OfferMounthDelegate:NSObjectProtocol {
    
    func mounthselected(cellId: NSInteger, tag: NSInteger);
}

class OferMounthCell: UITableViewCell {

    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    @IBOutlet weak var viewLeft: UIView!
    @IBOutlet weak var viewRight: UIView!
    
    weak var offerMounthDelegate:OfferMounthDelegate?
    
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

    func setCellData(id: NSInteger, enabled0 :Bool, enabled1: Bool){
        
        self.cellId = id;
        viewLeft.tag = 0
        viewRight.tag = 1
        
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
        
        if enabled0 == true {
            
            self.imageLeft.image = UIImage(named: "period_checked")
            
        }else{
            
            self.imageLeft.image = UIImage(named: "period_plus")
        }
        
        if enabled1 == true {
            
            self.imageRight.image = UIImage(named: "period_checked")
            
        }else{
            
            self.imageRight.image = UIImage(named: "period_plus")
        }

    }
    func modifyClicked(_ sender: UITapGestureRecognizer) {
        
        let selectedTag = sender.view?.tag
        offerMounthDelegate?.mounthselected(cellId: self.cellId, tag: selectedTag!)
        print("OferMounthCell view is: \(selectedTag ?? 3 )" )
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
