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
    
    @IBOutlet weak var Child2TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Child2TableView.separatorInset = UIEdgeInsets.init(top: 0,left: 28,bottom: 0,right: 27)

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
