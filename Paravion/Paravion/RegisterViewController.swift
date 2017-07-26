//
//  RegisterViewController.swift
//  Paravion
//
//  Created by Apple on 27/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var imageCenter: UIImageView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RegisterViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            let numeCell:registerType1Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType1Cell") as? registerType1Cell
            cell = numeCell!;
            break
            
        case 2:
            let numeCell:registerType2Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType2Cell") as? registerType2Cell
            cell = numeCell!;
            break
            
        case 3:
            let numeCell:registerType1Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType1Cell") as? registerType1Cell
            cell = numeCell!;
            break
            
        case 4:
            let numeCell:registerType1Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType1Cell") as? registerType1Cell
            cell = numeCell!;
            break
            
        case 5:
            let numeCell:registerType1Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType1Cell") as? registerType1Cell
            cell = numeCell!;
            break
            
        case 6:
            let numeCell:registerType3Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType3Cell") as? registerType3Cell
            cell = numeCell!;
            break
            
        case 0:
            let numeCell:registerType4Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType4Cell") as? registerType4Cell
            cell = numeCell!;
            break
        default:
            break;
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension RegisterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 70;
    }
}
