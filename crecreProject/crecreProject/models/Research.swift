//
//  Research.swift
//  crecreProject
//
//  Created by 황채연 on 11/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

//import Foundation
//import UIKit

//// Music 모델입니다.
//// 멤버 변수가 총 세 개인 Music 구조체를 생성했습니다.
//struct Result {
//    var ResultImage: UIImage?
//    var ResultCategory: String
//    var ResultName : String
//    var ResultClass: UIImage?
//    var ResultCount: String
//
//    init(resultImage: String, resultcategory: String,resultname : String, resultclass: String, resultcount: String) {
//        self.ResultImage = UIImage(named: resultImage)
//        self.ResultCategory = resultcategory
//        self.ResultName = resultname
//        self.ResultClass = UIImage(named: resultclass)
//        self.ResultCount = resultcount
//   }
//}

import Foundation

// MARK: - Webtoon
struct Result: Codable {
    let ResultImage: String
    let ResultCategory: String
    let  ResultName : String
    let ResultClass: String
   let  ResultCount: Int
}
