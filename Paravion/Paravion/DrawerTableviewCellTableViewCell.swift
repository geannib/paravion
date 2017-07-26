//
//  DrawerTableviewCellTableViewCell.swift
//  Paravion
//
//  Created by Apple on 26/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class DrawerTableviewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var labelCenter: UILabel!
    var cellTitles:Array = ["Datele mele", "Whishlist", "Refa quiz-ul", "Tutorial", "Feedback", "Iesi din cont"]
    var cellImages:Array = ["DateleMele", "wishlist", "refaquiz", "tutorial", "feedback","logout"]
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
    }

    func setCellData(indexPath: IndexPath){
        
        let row = indexPath.row
        let txt:String = (row < self.cellTitles.count) ? self.cellTitles[row] : "error"
        let img:UIImage? = (row < self.cellImages.count) ? UIImage(named:self.cellImages[row]) : UIImage(named:"feedback")
        
        self.imageLeft.image = img
        self.labelCenter.text = txt
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
