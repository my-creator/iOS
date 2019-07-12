//
//  Vote.swift
//  crecreProject
//
//  Created by 황채연 on 13/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import Foundation
import UIKit


struct Vote {
    var classImg: UIImage?
    var titleImg: UIImage?
    var optionTitle: String
    
    
    init(classimage: String, titleImage: String, titleoption: String) {
        
        self.classImg = UIImage(named: classimage)
        self.titleImg = UIImage(named: titleImage)
        self.optionTitle = titleoption
        
    }
}
