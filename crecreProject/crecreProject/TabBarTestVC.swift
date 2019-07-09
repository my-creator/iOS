//
//  TabBarTestVC.swift
//  crecreProject
//
//  Created by 황채연 on 04/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit
import SwipeViewController


class TabBarTestVC: UIViewController {
    
    
    
    
    let myViewControllerOne = UIViewController()
    let myViewControllerTwo = UIViewController()
  
    override func viewDidLoad() {
        
        
        let navigationController = SwipeViewController(pages: [myViewControllerOne, myViewControllerTwo])
            myViewControllerOne.title = "Recent"
    
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
