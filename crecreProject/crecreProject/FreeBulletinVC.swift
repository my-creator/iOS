//
//  FreeBulletinVC.swift
//  crecreProject
//
//  Created by 하준혁 on 2019. 7. 2..
//  Copyright © 2019년 하준혁. All rights reserved.
//

import UIKit

class FreeBulletinVC: UIViewController {

    @IBOutlet weak var FreeBulletinTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        FreeBulletinTV.separatorInset = UIEdgeInsets.init(top: 0,left: 28,bottom: 0,right: 27)
        // Do any additional setup after loading the view.
        self.title = "최신글"
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
