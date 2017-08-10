//
//  TutorialP3ViewController.swift
//  Paravion
//
//  Created by Apple on 08/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class TutorialP3ViewController: UIViewController {

    @IBOutlet weak var viewMain:UIView!
    @IBOutlet weak var viewTop:UIView!
    @IBOutlet weak var viewButtom:UIView!
    @IBOutlet weak var image0:UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewOptions: UIView!
    @IBOutlet weak var viewOption0:UIView!
    @IBOutlet weak var viewOption1: UIView!
    @IBOutlet weak var viewOption2: UIView!
    @IBOutlet weak var viewOption3: UIView!
    @IBOutlet weak var imgView0: UIImageView!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    
    
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
        viewLabel.backgroundColor = UIColor.clear
        labelTitle.backgroundColor = UIColor.clear
        viewOptions.backgroundColor = UIColor.clear
        viewOption0.backgroundColor = UIColor.clear
        viewOption0.tag = 0
        viewOption1.backgroundColor = UIColor.clear
        viewOption1.tag = 1
        viewOption2.backgroundColor = UIColor.clear
        viewOption2.tag = 2
        viewOption3.backgroundColor = UIColor.clear
        viewOption3.tag = 3
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TutorialP3ViewController.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(TutorialP3ViewController.myviewTapped(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(TutorialP3ViewController.myviewTapped(_:)))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.numberOfTouchesRequired = 1
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(TutorialP3ViewController.myviewTapped(_:)))
        tapGesture4.numberOfTapsRequired = 1
        tapGesture4.numberOfTouchesRequired = 1
        viewOption0.addGestureRecognizer(tapGesture)
        viewOption0.isUserInteractionEnabled = true
        viewOption1.addGestureRecognizer(tapGesture2)
        viewOption1.isUserInteractionEnabled = true
        viewOption2.addGestureRecognizer(tapGesture3)
        viewOption2.isUserInteractionEnabled = true
        viewOption3.addGestureRecognizer(tapGesture4)
        viewOption3.isUserInteractionEnabled = true
        
        labelTitle.text = "Alege imaginea care te inspira cel mai mult"
        
    }
    
    
    func myviewTapped(_ sender: UITapGestureRecognizer) {
        
        
        let selectedTag = sender.view?.tag
        print("Tapped view is: \(selectedTag ?? 3 )" )
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

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
