//
//  Comment.swift
//  crecreProject
//
//  Created by 하준혁 on 11/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import Foundation
import UIKit

struct comment {
    var commentContent: String
    var commentName: String
    var commentInfo: String
    
    init(content: String, name: String, info: String) {
        commentContent = content
        commentInfo = info
        commentName = name
    }
}
