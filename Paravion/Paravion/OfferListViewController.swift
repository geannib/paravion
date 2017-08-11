//
//  OfferListViewController.swift
//  Paravion
//
//  Created by Apple on 11/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class OfferListViewController: UIViewController {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewButtom: UIView!
    @IBOutlet weak var viewTopTitle: UIView!
    @IBOutlet weak var viewTopOptions: UIView!
    @IBOutlet weak var viewOptionWishlist: UIView!
    @IBOutlet weak var viewOptionTripmatch: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelWish1: UILabel!
    @IBOutlet weak var labelWish2: UILabel!
    @IBOutlet weak var labelTrip1: UILabel!
    @IBOutlet weak var labelTrip2: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageAvatar: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUp()

        // Do any additional setup after loading the view.
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
        gradientLayer.startPoint = CGPoint(x:0.2, y:0.2)
        gradientLayer.endPoint = CGPoint(x:0.7, y:0.7)
        gradientLayer.frame = self.viewTopTitle.frame
        self.viewTopTitle.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    func makeUp(){
       
        viewMain.backgroundColor = UIColor.white
        viewTop.backgroundColor = UIColor.clear
        viewButtom.backgroundColor = UIColor.clear
        viewTopTitle.backgroundColor = UIColor.clear
        viewTopOptions.backgroundColor = UIColor.clear
        viewOptionWishlist.backgroundColor = UIColor.clear
        viewOptionTripmatch.backgroundColor = UIColor.clear
        labelTitle.backgroundColor = UIColor.clear
        labelTrip1.backgroundColor = UIColor.clear
        labelTrip2.backgroundColor = UIColor.clear
        labelWish1.backgroundColor = UIColor.clear
        labelWish2.backgroundColor = UIColor.clear
        imageAvatar.image = UIImage(named:"selImg0")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TutorialP3ViewController.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(TutorialP3ViewController.myviewTapped(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        viewOptionWishlist.tag = 0
        viewOptionWishlist.addGestureRecognizer(tapGesture)
        viewOptionWishlist.isUserInteractionEnabled = true
        viewOptionWishlist.tag = 1
        viewOptionTripmatch.addGestureRecognizer(tapGesture2)
        viewOptionTripmatch.isUserInteractionEnabled = true
    }
    
    func myviewTapped(_ sender: UITapGestureRecognizer) {
        
        let selectedTag = sender.view?.tag
        print("Tapped view is: \(selectedTag ?? 3 )" )
        
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


extension OfferListViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            
            let offerCell:OfferListCell? = self.tableView.dequeueReusableCell(withIdentifier: "OfferListCell") as? OfferListCell
            
            offerCell!.layer.backgroundColor = UIColor.clear.cgColor
            offerCell?.selectionStyle = .none
        offerCell?.labeltTop.text = "Zakintos"
        offerCell?.labelBottom.text = "Grecia/7 zile/charter"
        
            return offerCell!
            }
}


extension OfferListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("offer list row \(indexPath.row) was clicked")
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
}

