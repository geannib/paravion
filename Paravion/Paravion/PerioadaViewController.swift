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
    var selectedMounths = [0,1,2,10,11]
    var adultiCnt = 0
    var copiiCnt = 4
    var bebelusiCnt = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewTop.backgroundColor = .clear
        tableMain.delegate = self
        tableMain.dataSource = self
//        imageBack.image = UIImage(named: "feedback")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PerioadaViewController.backClicked(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        imageBack.addGestureRecognizer(tapGesture)
        imageBack.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }

    func backClicked(_ sender: UITapGestureRecognizer) {
        
        let selectedTag = sender.view?.tag
        print("PerioadaViewController back clicked" )
        self.navigationController?.popViewController(animated: true)
        
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
                lunaCell?.offerMounthDelegate = self
                let mounth0 = (indexPath.row - 1) * 2
                let mounth1 = (indexPath.row - 1) * 2 + 1
                var enabled0 = false
                var enabled1 = false
                for idx in 0...self.selectedMounths.count - 1{
                    
                    if self.selectedMounths[idx] == mounth0 {
                        enabled0 = true
                    }
                    
                    if self.selectedMounths[idx] == mounth1 {
                        enabled1 = true
                    }
                }
                lunaCell?.setCellData(id: indexPath.row - 1, enabled0: enabled0, enabled1: enabled1)
                
                retCell = lunaCell!
            }
            
        }else{
            
            let countCell = self.tableMain.dequeueReusableCell(withIdentifier: "OfferPersonsCell") as? OfferPersonsCell
            var cnt = 0
            if indexPath.row == 0{
                cnt = self.adultiCnt
            }else if indexPath.row == 1{
                cnt = self.copiiCnt
            }else{
                cnt = self.bebelusiCnt
            }
            countCell?.setCellData( id: indexPath.row, count:cnt)
            
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

extension PerioadaViewController: OfferMounthDelegate {
    
    func mounthselected(cellId: NSInteger, tag: NSInteger){
        
        let mounthId = cellId * 2 + tag
        
        var found = false
        for idx in 0...self.selectedMounths.count - 1{
            if self.selectedMounths[idx] == mounthId {
                self.selectedMounths.remove(at: idx)
                found = true
                break;
            }
        }
        if found == false {
            
            self.selectedMounths.append(mounthId)
        }
        self.tableMain.reloadData()
    }
    
}

extension PerioadaViewController: OfferPersonDelegate{
    
    func countChanged(id:NSInteger, up:Bool){
        
        if id == 0 {
            
            if up == true{
                 self.adultiCnt = self.adultiCnt + 1
            }else{
                self.adultiCnt = self.adultiCnt - 1
            }
        }
        
        if id == 1{
            
            if up == true{
                self.copiiCnt = self.copiiCnt + 1
            }else{
                self.copiiCnt = self.copiiCnt - 1
            }
        }
        
        if id == 2 {
            
            if up == true{
                self.bebelusiCnt = self.bebelusiCnt + 1
            }else{
                self.bebelusiCnt = self.bebelusiCnt - 1
            }
        }
        
        self.tableMain.reloadData()
    }
}
