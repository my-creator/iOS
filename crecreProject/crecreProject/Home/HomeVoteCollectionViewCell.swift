//
//  HomeVoteCollectionViewCell.swift
//  crecreProject
//
//  Created by 황채연 on 13/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class HomeVoteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var OptionClassImage: UIImageView!
    
    @IBOutlet weak var OptionTitleImage: UIImageView!
    
    @IBOutlet weak var OptionTitleLabel: UILabel!
 
    @IBOutlet weak var ClickBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        OptionTitleLabel.layer.cornerRadius = 3
     //   albumImg.layer.masksToBounds = true
    }
    
    
}
