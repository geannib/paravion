//
//  registerType1Cell.swift
//  Paravion
//
//  Created by Apple on 27/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

enum registerType1Kind{ case name, email, telefon, birthday, oras}




class registerType1Cell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet  weak  var labelKind: UILabel!
    @IBOutlet weak var inputKind: UITextField!
    var userObject:UserObject = UserObject()
    var type:registerType1Kind = registerType1Kind.name
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.inputKind.addTarget(self, action: #selector(registerType1Cell.textFieldDidEndEditing(_:)), for: .editingDidEnd)
        self.inputKind.borderStyle = .none
        self.inputKind.backgroundColor = UIColor.lightGray
        
        // Initialization code
    }
    
    func setCellData(type: registerType1Kind, newUser:UserObject){
        
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

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.resignFirstResponder()
    }
    
    func textFieldDidChanged(_ textField:UITextField){
        
        switch type {
            case .name:
                userObject.name = textField.text!
                break;
                
            case .email:
                userObject.email = textField.text!
                break;
                
            case .telefon:
                userObject.telephone = textField.text!
                break
            case .birthday:
                userObject.birthday = textField.text!
                break
                
            case .oras:
                userObject.city = textField.text!
                break
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        return false;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
