//
//  PerioadaViewController.swift
//  Paravion
//
//  Created by Apple on 14/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class PerioadaViewController: UIViewController {

    @IBOutlet weak var imageBack:UIImageView!
    @IBOutlet weak var viewTop:UIView!
    @IBOutlet weak var tableMain:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewTop.backgroundColor = .clear
        tableMain.delegate = self
        tableMain.dataSource = self
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

extension PerioadaViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 7
            
        }else{
            
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var retCell = UITableViewCell()
        if indexPath.section == 0 {
            if (indexPath.row == 0){
                
                let ieftinCell = self.tableMain.dequeueReusableCell(withIdentifier: "OfferPretMicCell") as? OfferPretMicCell
                
                retCell = ieftinCell!
                
            }else{
                
                let lunaCell = self.tableMain.dequeueReusableCell(withIdentifier: "OferMounthCell") as? OferMounthCell
                lunaCell?.setCellData(id: indexPath.row - 1)
                
                retCell = lunaCell!
            }
            
        }else{
            
            let countCell = self.tableMain.dequeueReusableCell(withIdentifier: "OfferPersonsCell") as? OfferPersonsCell
            countCell?.setCellData( id: indexPath.row)
            
            retCell = countCell!
        }
        
        
        return retCell
    }
}


extension PerioadaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        
//        return CGFloat.leastNormalMagnitude
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        
        if section == 0{
            
            return "In ce perioada vrei sa calatoresti?"
            
        }else{
            
            return "Selecteaza numbar pasageri"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 59;
    }
}
