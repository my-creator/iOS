//
//  SearchController.swift
//  crecreProject
//
//  Created by 하준혁 on 2019. 7. 1..
//  Copyright © 2019년 하준혁. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    @IBOutlet weak var navigationcontroller: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.topItem?.title = ""
        let brightRed = UIColor(displayP3Red: 255.0, green: 87.0, blue: 247.0, alpha: 1.0)
        self.title = "검색"
        
        self.navigationController?.navigationBar.barTintColor = brightRed
        
    }
    
    

}
