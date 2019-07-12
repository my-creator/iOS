//
//  VoteChildVC1.swift
//  crecreProject
//
//  Created by 황채연 on 03/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class VoteChildVC1: UIViewController, IndicatorInfoProvider {
  
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image1.image = UIImage(named: "food" )
        image2.image = UIImage(named: "sing")
        // Do any additional setup after loading the view.
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "진행중인 투표")
    }


}
