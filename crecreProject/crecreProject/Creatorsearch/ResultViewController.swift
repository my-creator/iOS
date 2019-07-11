//
//  ResultViewController.swift
//  crecreProject
//
//  Created by 황채연 on 10/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit
import Alamofire

class ResultViewController: UIViewController {

    @IBOutlet weak var ResearchTableView: UITableView!
    
    @IBOutlet weak var SearchBarView: UIView!
    
    @IBOutlet weak var CreatorCnt: UILabel!
    
    
    var resultList: [Result] = []
    
    override func viewDidLoad() {
      
    
     //   setRankData()
        super.viewDidLoad()
        
        
        let image = UIImage(named: "navigationbar")
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        
        ResearchTableView.delegate = self as? UITableViewDelegate
        ResearchTableView.dataSource = self
        
        
        SearchBarView.layer.cornerRadius = 6
        SearchBarView.layer.borderColor = UIColor(white: 112/255, alpha: 1).cgColor
        SearchBarView.layer.borderWidth = 2
        
          getCreatorInfo(creator_name:"tv")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          getCreatorInfo(creator_name:"tv")
       
    }
    
    func getCreatorInfo(creator_name: String) {
        
        CreatorSearchService.shared.getCreatorInfo(creator_name: creator_name) {
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            switch data {
            case .success(let res):
                
                self.resultList = res as! [Result]
                self.ResearchTableView.reloadData()
                
                break
            case .requestErr(let err):
                print(".requestErr(\(err))")
                break
            case .pathErr:
                // 대체로 경로를 잘못 쓴 경우입니다.
                // 오타를 확인해보세요.
                print("경로 에러")
                break
            case .serverErr:
                // 서버의 문제인 경우입니다.
                // 여기에서 동작할 행동을 정의해주시면 됩니다.
                print("서버 에러")
                break
            case .networkFail:
               // self.simpleAlert(title: "통신 실패", message: "네트워크 상태를 확인하세요.")
                break
            }
        }
    }// func

}

extension ResultViewController: UITableViewDataSource {

    
    // UITalbeView 에 얼마나 많은 리스트를 담을 지 설정합니다.
    // 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return resultList.count
        
    }


    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = ResearchTableView.dequeueReusableCell(withIdentifier: "ResearchViewCell") as! ResearchViewCell

        let result = resultList[indexPath.row]
        
    
        cell.ResultImage.imageFromUrl(result.profileUrl, defaultImgPath: "ic_up")
        cell.ResultCategory.text = result.categoryName
        cell.ResultName.text = result.creatorName
        cell.ResultClass.imageFromUrl(result.imgUrl, defaultImgPath: "ic_up")
        cell.ResultCount.tag = result.youtubeSubscriberCnt
 
        return cell
    }
}


//extension ResultViewController {
 //   func setRankData() {
//        let result1 = Result(resultImage: "icn_down", resultcategory: "먹방", resultname: "얌무", resultclass: "icn_class5_3x", resultcount: "23,345,236")
//        let result2 = Result(resultImage: "ic_up", resultcategory: "뷰티", resultname: "이사배", resultclass: "icn_class6_3x", resultcount: "52,423,235")
//        let result3 = Result(resultImage: "icn_down", resultcategory: "브이로그", resultname: "오눅", resultclass: "icn_class4_3x", resultcount: "12,424,124")
//        let result4 = Result(resultImage: "icn_down", resultcategory: "게임", resultname: "대도서관", resultclass: "icn_class5_3x", resultcount: "41,124,124")
//        let result5 = Result(resultImage: "ic_up", resultcategory: "요리", resultname: "백정원", resultclass: "icn_class6_3x", resultcount: "85,234,356")
        
       
        
//        resultList = [result1, result2, result3, result4, result5]
        
 //   }
    
//}





