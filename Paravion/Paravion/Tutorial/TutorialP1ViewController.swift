//
//  TutorialP1ViewController.swift
//  Paravion
//
//  Created by Apple on 08/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class TutorialP1ViewController: UIViewController {

    @IBOutlet weak var viewMain:UIView!
    @IBOutlet weak var viewTop:UIView!
    @IBOutlet weak var viewButtom:UIView!
    @IBOutlet weak var image0:UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var tableView:UITableView!
    let txtOptins:NSArray = ["cu familia", "cu prietenii", "in doi/cu perechea", "independent"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUp()
       
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let colorLeft =  UIColor(red: 240.0/255.0, green: 0.0/255.0, blue: 95.0/255.0, alpha: 1.0).cgColor
        let colorRight = UIColor(red: 112.0/255.0, green: 0.0/255.0, blue: 124.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorLeft, colorRight]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x:0.0, y:0.0)
        gradientLayer.endPoint = CGPoint(x:1.0, y:1.0)
        gradientLayer.frame = self.viewMain.bounds
        self.viewMain.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func makeUp(){
        
        self.viewTop.backgroundColor = UIColor.clear
        self.viewButtom.backgroundColor = UIColor.clear
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.isOpaque = false
        self.tableView.separatorStyle = .none
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

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

extension TutorialP1ViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return txtOptins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0){
            
            let titleCell:TutorialTitleCell? = self.tableView.dequeueReusableCell(withIdentifier: "TutorialTitleCell") as? TutorialTitleCell
            
            titleCell!.layer.backgroundColor = UIColor.clear.cgColor
            titleCell?.selectionStyle = .none
            titleCell?.labelTitle.text = "Cum calatoresti?"
            return titleCell!
        }else{
            
            let optionCell:tutorialOptionCell? = self.tableView.dequeueReusableCell(withIdentifier: "tutorialOptionCell") as? tutorialOptionCell
            optionCell?.selectionStyle = .none
            optionCell?.labelTitle.text = txtOptins[indexPath.row] as? String
            
            return optionCell!
        }
    }
}


extension TutorialP1ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("P1, row \(indexPath.row) was clicked")
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 59;
    }
}
