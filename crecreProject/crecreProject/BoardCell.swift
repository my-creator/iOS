//
//  BoardCell.swift
//  crecreProject
//
//  Created by 하준혁 on 2019. 7. 2..
//  Copyright © 2019년 하준혁. All rights reserved.
//

import UIKit

class BoardCell: UITableViewCell {

    @IBOutlet weak var BoardImg: UIImageView!
    @IBOutlet weak var BoardTitle: UILabel!
    @IBOutlet weak var BoardInfo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BoardImg.layer.cornerRadius = 5
        BoardImg.layer.masksToBounds = true
    }

}
