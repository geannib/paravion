//
//  UIViewController.swift
//  Paravion
//
//  Created by Apple on 19/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

extension UIViewController {
    func setNavigationBarItem() {
        
        
        if UIView.userInterfaceLayoutDirection(for: (view.semanticContentAttribute)) == .rightToLeft
        {
            
            self.addLeftBarButtonWithImage(UIImage(named:"hamburger_menu_icon-fliped")!)
        }else
        {
            self.addLeftBarButtonWithImage(UIImage(named:"side_menu_hamburger_icon")!)
        }
        
        
        
        //self.addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
}
