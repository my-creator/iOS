//
//  post.swift
//  crecreProject
//
//  Created by 하준혁 on 10/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import Foundation
import UIKit

struct post {
    var postImage: UIImage?
    var postHotImage: UIImage?
    var postTitle: String
    var postInfo: String
    
    init(title: String, info: String, coverName: String, coverNameInfo: String) {
        self.postTitle = title
        self.postInfo = info
        self.postImage = UIImage(named: coverName)
        self.postHotImage = UIImage(named: coverNameInfo)
    }
}
