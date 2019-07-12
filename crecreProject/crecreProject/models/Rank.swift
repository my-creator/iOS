//
//  Rank.swift
//  crecreProject
//
//  Created by 황채연 on 10/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//
//
//import Foundation
//import UIKit
//
//struct Rank {
//    var RankLabel  : String
//    var RankTitleLabel : String
//    var RankVariationLabel : String
//    var UpdownImage : UIImage?
//
//    init(rank: String, ranktitle: String, rankvariation: String, updown : String) {
//        self.RankLabel = rank
//        self.RankTitleLabel = ranktitle
//        self.RankVariationLabel = rankvariation
//        self.UpdownImage = UIImage(named: updown)
//    }
//}

import Foundation

// MARK: - Webtoon
struct Rank: Codable {
    let ranking: Int
    let creatorName: String
    let searchCnt: Int
}
