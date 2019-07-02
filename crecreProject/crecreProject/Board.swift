//
//  Board.swift
//  crecreProject
//
//  Created by 하준혁 on 2019. 7. 2..
//  Copyright © 2019년 하준혁. All rights reserved.
//

import Foundation
import UIKit

struct Board {
    var boardImg: UIImage?
    var boardTitle: String
    var boardInfo: String
    
    init(title: String, info: String, CoverName: String) {
        self.boardImg = UIImage(named: CoverName)
        self.boardTitle = title
        self.boardInfo = info
    }
}

