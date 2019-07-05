//
//  Current_VoteVC.swift
//  crecreProject
//
//  Created by 황채연 on 03/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ParentViewController: ButtonBarPagerTabStripViewController {
    
    
    
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child2")
        return [child_1, child_2]
    }
}
