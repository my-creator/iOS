//
//  Vote.swift
//  crecreProject
//
//  Created by 황채연 on 10/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import Foundation
import UIKit

// Music 모델입니다.
// 멤버 변수가 총 세 개인 Music 구조체를 생성했습니다.
struct TapVote {
    var VoteImage: UIImage?
    var Closeddate : String
    var VoteTitle: String
    var DetailTitle : String
    
    init(image: String, closeddate: String, title: String, detailtitle:String) {
        self.VoteImage = UIImage(named: image)
        self.Closeddate = closeddate
        self.VoteTitle = title
        self.DetailTitle = detailtitle
    }
}
