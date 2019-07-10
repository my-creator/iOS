//
//  CommuChildVC1.swift
//  crecreProject
//
//  Created by 하준혁 on 03/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CommuChildVC1: UIViewController, IndicatorInfoProvider{

    
    @IBOutlet weak var Child1TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Child1TableView.separatorInset = UIEdgeInsets.init(top: 0,left: 28,bottom: 0,right: 27)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "최신글")
    }
    
    
    
    
    
}
