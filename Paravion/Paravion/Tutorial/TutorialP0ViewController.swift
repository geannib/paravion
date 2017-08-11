//
//  TutorialP0ViewController.swift
//  Paravion
//
//  Created by Apple on 08/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class TutorialP0ViewController: UIViewController {

    @IBOutlet weak var viewMain:UIView!
    @IBOutlet weak var viewTop:UIView!
    @IBOutlet weak var viewButtom:UIView!
    @IBOutlet weak var image0:UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var labelText: UILabel!
    
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
        self.labelText.backgroundColor = UIColor.clear
        self.buttonStart.backgroundColor = UIColor.white
        self.buttonStart.clipsToBounds = true
        self.buttonStart.layer.cornerRadius = 15
        
        self.buttonStart.setTitle("INCEPE", for: .normal)
        self.buttonStart.addTarget(self, action:  #selector(TutorialP0ViewController.incepeAction(_:)), for: .touchUpInside)
        
        self.labelText.text = "Salut! \r\n\r\nTrip Match este o aplicatie super usoara de folosit si distractiva. \r\n\r\nDoar seteaza-ti aplicatia cu cateva informatii standard si esti gata sa-i dai swipe pana la vacanta visurilor tale. \r\n\r\nTot ce ramane e sa te distrezi si sa ne impar- tasesti si noua, experienta ta pe pagina noastra de facebook. \r\n\r\nSwipe pentru a continua"

        
    }

      func incepeAction(_:UIButton){
        
        print("Incepe button was clicked")
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
