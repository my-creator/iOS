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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        let brightRed = UIColor(displayP3Red: 255.0, green: 87.0, blue: 247.0, alpha: 1.0)
        self.title = "인기글"
        
        self.navigationController?.navigationBar.barTintColor = brightRed
    }
    



}
