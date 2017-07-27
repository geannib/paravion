//
//  registerType1Cell.swift
//  Paravion
//
//  Created by Apple on 27/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

enum registerType1Kind{ case name, email, telefon, birthday, oras}




class registerType1Cell: UITableViewCell {

    @IBOutlet  weak  var labelKind: UILabel!
    @IBOutlet weak var inputKind: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.inputKind.addTarget(self, action: #selector(registerType1Cell.textViewDidEndEditing(_:)), for: .editingDidEnd)
        self.inputKind.borderStyle = .none
        self.inputKind.backgroundColor = UIColor.lightGray
        
        // Initialization code
    }
    
    func setCellData(type: registerType1Kind){
        
        switch type {
        case .name:
            labelKind.text = "Nume"
            break;
        case .email:
            labelKind.text = "Email"
            break;
        case .telefon:
            labelKind.text = "Telefon"
            break
        case .birthday:
            labelKind.text = "Zi de nastere"
            break
        case .oras:
            labelKind.text = "Oras"
            break
     
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        
        textView.resignFirstResponder()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
