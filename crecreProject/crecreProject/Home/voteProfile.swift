//
//  voteProfile.swift
//  crecreProject
//
//  Created by 하준혁 on 13/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import Foundation
import UIKit

struct voteProfile {
    var rankImage: UIImage?
    var profileImage: UIImage?
    var profileName: String
    
    init(image: String, profileImage: String, name: String){
        self.rankImage = UIImage(named: image)
        self.profileImage = UIImage(named: profileImage)
        self.profileName = name
    }
}
