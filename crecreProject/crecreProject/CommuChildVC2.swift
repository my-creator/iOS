//
//  CommuChildVC1.swift
//  crecreProject
//
//  Created by 하준혁 on 03/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CommuChildVC2: UIViewController, IndicatorInfoProvider{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "인기글")
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
