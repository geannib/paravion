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
    
    let userObject = UserObject()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.makeUp()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        gradientLayer.frame = buttonSave.bounds
        
        buttonSave.layer.cornerRadius = 10
        buttonSave.clipsToBounds = true
        buttonSave.addTarget(self, action: #selector(self.doSaveButton(_:)), for: UIControlEvents.touchUpInside)
        buttonSave.layer.insertSublayer(gradientLayer, at: 0)
    }
    func makeUp(){
        
        self.viewMain.backgroundColor = .white
        self.viewHeader.backgroundColor = .white
        
       
    }
    
    func doSaveButton(_:UIButton){
        print("save button pressed")
        
        var postParams:[String: String] = [:]
        postParams["name"] = "ion"
        postParams["gender"] = "m"
        postParams["email"] = "asdfg1h2@gmail.com"
        postParams["phone"] = "123456789"
        postParams["birthdate"] = "21 May 2010"
        postParams["city"] = "Craiova"
        postParams["password"] = "123"
            
        RestApiManager.sharedInstance.registerUser(postParams: postParams) { (response: Dictionary<String, Any>) in
            
            //Network issue
            if response.count == 0 {
                let alert = UIAlertController(title: "Error", message: "Registration fails", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)

                return
            }
            let resType:String = (response["resType"] as? String)!
            if (resType != "success"){
                
                let offersStoryboard = UIStoryboard(name: "Main", bundle: nil)
                 let allOffers = offersStoryboard.instantiateViewController(withIdentifier: "AllOffersViewController") as! AllOffersViewController
                self.navigationController?.pushViewController(allOffers, animated: true)
                print("regsiter user success\(response)")
                
            }else{
                
                let alert = UIAlertController(title: "Error", message: "Registration fails", preferredStyle: UIAlertControllerStyle.alert)
               
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                print("register user fails\(response)")
            }
        }
    }
    @IBAction func onActionTableTap(_ sender: Any) {
        
        print("table was tapped")
        self.view.endEditing(true)
    }

   
    @IBAction func onActionMaleTap(_ sender: Any) {
        print("action mail tapped")
    }
    
    @IBAction func onActionFemaleTap(_ sender: Any) {
        
        print("action female tapped")
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
            numeCell?.setCellData(type: .name, newUser: userObject)
            cell = numeCell!;
            break
            
        case 1:
            let numeCell:registerType2Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType2Cell") as? registerType2Cell
            
            cell = numeCell!;
            break
            
        case 2:
            let emailCell:registerType1Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType1Cell") as? registerType1Cell
            
            emailCell?.setCellData(type: .email, newUser: userObject)
            cell = emailCell!;
            break
            
        case 3:
            let telefonCell:registerType1Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType1Cell") as? registerType1Cell
            telefonCell?.setCellData(type: .telefon, newUser: userObject)
            cell = telefonCell!;
            break
            
        case 4:
            let birthdayCell:registerType1Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType1Cell") as? registerType1Cell
            birthdayCell?.setCellData(type: .birthday, newUser: userObject)
            cell = birthdayCell!;
            break
            
        case 5:
            let orasCell:registerType1Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType1Cell") as? registerType1Cell
            orasCell?.setCellData(type: .oras, newUser: userObject)
            cell = orasCell!;
            break
            
        case 6:
            let adaugaPoza:registerType3Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType3Cell") as? registerType3Cell
           
            cell = adaugaPoza!;
            break
            
        case 7:
            let disclaimerCell:registerType4Cell? = self.tableViewMain.dequeueReusableCell(withIdentifier: "registerType4Cell") as? registerType4Cell
            
            cell = disclaimerCell!;
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
        
        return 59;
    }
}
