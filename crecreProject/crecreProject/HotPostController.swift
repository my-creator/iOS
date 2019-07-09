//
//  HotPostController.swift
//  crecreProject
//
//  Created by 하준혁 on 2019. 7. 2..
//  Copyright © 2019년 하준혁. All rights reserved.
//

import UIKit

class HotPostController: UIViewController {

    @IBOutlet weak var HotTableView: UITableView!
    @IBOutlet weak var HotBulletinTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HotTableView.separatorInset = UIEdgeInsets.init(top: 0,left: 28,bottom: 0,right: 27)
        self.navigationController?.navigationBar.topItem?.title = ""
        let brightRed = UIColor(displayP3Red: 255.0, green: 87.0, blue: 247.0, alpha: 1.0)
        self.title = "인기글"
        
        self.navigationController?.navigationBar.barTintColor = brightRed
    }
    



}
