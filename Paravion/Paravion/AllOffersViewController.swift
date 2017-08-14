//
//  AllOffersViewController.swift
//  Paravion
//
//  Created by Apple on 11/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class AllOffersViewController: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var imageCalender:UIImageView!
    @IBOutlet weak var labelPerioada:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUp()
        
        RestApiManager.sharedInstance.getAllOffers(token: "") { (response: Dictionary<String, Any>) in
            
            if response.count > 0{
                
                print("we have offers\(response)")
                
            }else{
                
                print("We don't have offers")
            }
        }

        // Do any additional setup after loading the view.
    }

    func makeUp(){
        
        viewTop.backgroundColor = .gray
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AllOffersViewController.calendatTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        
        viewTop.addGestureRecognizer(tapGesture)

    }
    
    func calendatTapped(_ sender: UITapGestureRecognizer){
        
        print("calendar tapped")
        let offersStoryboard = UIStoryboard(name: "Offers", bundle: nil)
        let periodView = offersStoryboard.instantiateViewController(withIdentifier: "PerioadaViewController") as! PerioadaViewController
        self.navigationController?.pushViewController(periodView, animated: true)
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
