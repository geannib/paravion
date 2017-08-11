//
//  DrawerViewController.swift
//  Paravion
//
//  Created by Apple on 19/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import FacebookLogin
import SlideMenuControllerSwift

protocol DrawerDelegate:NSObjectProtocol {
    
    func pushSomething();
}

struct drawyerType{
    
    static let dateleMele = 0
    static let whishlist = 1
    static let refaQuiz = 2
    static let tutorial = 3
    static let feedback = 4
    static let logout = 5
}

class DrawerViewController: UIViewController {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var imagePoweredBy: UIImageView!
    @IBOutlet weak var imageCenter: UIImageView!
    @IBOutlet weak var viewPoweredBy: UIView!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewHeader:UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var tableOptions: UITableView!
     weak var drawerDelegate:DrawerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

      self.makeup()
//        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
//        loginButton.center = view.center
//        
//        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeup(){
        
        SlideMenuOptions.rightViewWidth = 100
        SlideMenuOptions.contentViewScale = 1.0
        
        tableOptions.estimatedRowHeight = 130
        tableOptions.rowHeight = UITableViewAutomaticDimension

        self.viewHeader.backgroundColor = UIColor.white
        self.viewName.backgroundColor = UIColor.red
        self.viewPoweredBy.backgroundColor = UIColor.clear
        
        //round the avatar
        let image = self.imageAvatar!
        image.layer.borderWidth = 2
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
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

extension DrawerViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
               return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        
        let optionCell:DrawerTableviewCellTableViewCell? = self.tableOptions.dequeueReusableCell(withIdentifier: "DrawerTableviewCellTableViewCell") as? DrawerTableviewCellTableViewCell


        optionCell?.setCellData(indexPath: indexPath)
        return optionCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print("DateleMele clicked")
            break;
        case 1:
            
            self.slideMenuController()?.closeLeft()
            self.slideMenuController()?.closeRight()
            self.drawerDelegate?.pushSomething()
            
            break;
        case 2:
            print("Refa quiz clicked")
            let tutStoryboard = UIStoryboard(name: "Tutorial", bundle: nil)
             let tutorial = tutStoryboard.instantiateViewController(withIdentifier: "TutorialPageViewController") as! TutorialPageViewController
            self.present(tutorial, animated: true, completion: { 
                
                    //Nothing for now
            })
            break;
        case 3:
            print("Tutorial clicked")
            break;
        case 4:
            print("Feedback clicked")
            break;
        case 5:
            print("Iesi din cont clicked")
            break;
        default:
            print("Something it is wrong")
        }
    }
}

extension DrawerViewController: UITableViewDelegate {
    
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




