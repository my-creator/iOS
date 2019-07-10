//
//  HotTableViewCell.swift
//  crecreProject
//
//  Created by 하준혁 on 04/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class HotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hotPostImage: UIImageView!
    @IBOutlet weak var hotPostTitle: UILabel!
    @IBOutlet weak var hotPostInfo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

