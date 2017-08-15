//
//  OfferPersonsCell.swift
//  Paravion
//
//  Created by Apple on 14/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

protocol OfferPersonDelegate:NSObjectProtocol {
    
    func countChanged(id:NSInteger, up:Bool);
}

class OfferPersonsCell: UITableViewCell {

    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var viewLeft: UIView!
    @IBOutlet weak var viewMiddle: UIView!
    @IBOutlet weak var viewRight: UIView!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var labelCount: UILabel!
    
    weak var offerPersonDelegate: OfferPersonDelegate?
    
    var cellId: NSInteger = 0
    override func awakeFromNib() {
        
        viewRight.backgroundColor = UIColor.white
        viewMiddle.backgroundColor = .white
        viewLeft.backgroundColor = .white
        labelCount.backgroundColor = .white
        
                // Initialization code
    }
    
    func setCellData(id: NSInteger, count: NSInteger){
        
        super.awakeFromNib()
        
        self.cellId = id
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(OfferPersonsCell.modifyClicked(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(OfferPersonsCell.modifyClicked(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        
        viewRight.addGestureRecognizer(tapGesture)
        viewRight.isUserInteractionEnabled = true
        viewRight.tag = 1
        viewLeft.addGestureRecognizer(tapGesture2)
        viewLeft.isUserInteractionEnabled = true
        viewLeft.tag = 0
        
        self.labelCount.text = String(format:"%d", count)
        
        switch cellId {
        case 0:
            labelLeft.text = "Adulti"
            break
        case 1:
            labelLeft.text = "Copii"
            break
            
        case 2:
            labelLeft.text = "Bebelusi"
            break
        default:
            break
        }

    }
    func modifyClicked(_ sender: UITapGestureRecognizer) {
        
        
        let selectedTag = sender.view?.tag
        let up = selectedTag == 1
        offerPersonDelegate?.countChanged(id: cellId, up: up)
        print("OfferPersonsCell view is: \(selectedTag ?? 3 )" )
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
