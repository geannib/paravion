//
//  LoginViewController.swift
//  Paravion
//
//  Created by Apple on 12/08/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var viewMain:UIView!
    @IBOutlet weak var viewTop:UIView!
    @IBOutlet weak var viewMiddle:UIView!
    @IBOutlet weak var viewBottom:UIView!
    @IBOutlet weak var viewMiddle0:UIView!
    @IBOutlet weak var viewMiddle1:UIView!
    @IBOutlet weak var viewMiddle2:UIView!
    @IBOutlet weak var viewBottom0:UIView!
    @IBOutlet weak var viewBottom1:UIView!
    @IBOutlet weak var viewBottom2:UIView!
    @IBOutlet weak var viewButtom3:UIView!
    
    @IBOutlet weak var imgCenter:UIImageView!
    @IBOutlet weak var imgLogo:UIImageView!
    @IBOutlet weak var labelLogo:UILabel!
    
    @IBOutlet weak var labelBine: UILabel!
    @IBOutlet weak var labelSubBine:UILabel!
    @IBOutlet weak var labelEmail:UILabel!
    @IBOutlet weak var labelPassword:UILabel!
    @IBOutlet weak var labelUtilizatorNou:UILabel!
    
    @IBOutlet weak var inputEmail:UITextField!
    @IBOutlet weak var inputPassword:UITextField!
    @IBOutlet weak var buttonForgetPasswrod: UIButton!
    @IBOutlet weak var buttonCreazaCont:UIButton!
    @IBOutlet weak var buttonLoginFB:UIButton!
    @IBOutlet weak var buttonLogin:UIButton!
    @IBOutlet weak var buttonUItatParola:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUp()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func makeUp(){
        self.viewMain.backgroundColor = .white
        self.viewTop.backgroundColor = .white
        self.viewBottom.backgroundColor = .white
        self.viewBottom0.backgroundColor = .white
        self.viewBottom1.backgroundColor = .white
        self.viewBottom2.backgroundColor = .white
        self.viewButtom3.backgroundColor = .white
        self.viewMiddle0.backgroundColor = .white
        self.viewMiddle1.backgroundColor = .white
        self.viewMiddle2.backgroundColor = .white
        self.viewMiddle.backgroundColor = .white
        self.viewTop.backgroundColor = .white
        
        self.buttonLogin.setTitle("INTRA IN CONT", for: .normal)
        self.buttonLoginFB.setTitle("CONECTEAZA-TE CU FACEBOOK", for: .normal)
        self.buttonUItatParola.setTitle("Ai uitat parola?", for: .normal)
        self.buttonCreazaCont.setTitle("Creaza cont", for: .normal)
        
         self.buttonLogin.addTarget(self, action:  #selector(LoginViewController.doLogin(_:)), for: .touchUpInside)
         self.buttonLoginFB.addTarget(self, action:  #selector(LoginViewController.doLoginFB(_:)), for: .touchUpInside)
         self.buttonUItatParola.addTarget(self, action:  #selector(LoginViewController.doUitatParola(_:)), for: .touchUpInside)
         self.buttonCreazaCont.addTarget(self, action:  #selector(LoginViewController.doCreazaCont(_:)), for: .touchUpInside)
    }
    
    func doLogin(_:UIButton){
        
        print("doLogin clicked")
    }
    func doLoginFB(_:UIButton){
        
        print("doLoginFB clicked")
    }
    func doUitatParola(_:UIButton){
        
        print("doUitatParola clicked")
    }
    func doCreazaCont(_:UIButton){
        
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let register = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        self.navigationController?.pushViewController(register, animated: true)
        
        print("doCreazaCont clicked")
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
