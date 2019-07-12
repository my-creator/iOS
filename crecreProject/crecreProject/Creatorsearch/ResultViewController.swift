//
//  ResultViewController.swift
//  crecreProject
//
//  Created by 황채연 on 10/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit
import Alamofire

protocol SendDataDelegate {
    
    func sendData(data: String)
    
}

class ResultViewController: UIViewController {

    @IBOutlet weak var ResearchTableView: UITableView!
    
    @IBOutlet weak var SearchTextField: UITextField!
    
    @IBOutlet weak var SearchBarView: UIView!
    
    @IBOutlet weak var CreatorCnt: UILabel!
    
    @IBOutlet weak var SearchCnt: UIStackView!
    
    @IBOutlet weak var creatorAllCnt: UILabel!
    

    var delegate: SendDataDelegate?
    
    var countList : [Count] = []
    var resultList: [Result] = []
    
    override func viewDidLoad() {
      
      
  //  ResearchTableView.isHidden = true
   // SearchCnt.isHidden = true
     //   setRankData()
        super.viewDidLoad()
        
        
        let image = UIImage(named: "navigationbar")
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        
        ResearchTableView.delegate = self as? UITableViewDelegate
        ResearchTableView.dataSource = self
        
        
        SearchBarView.layer.cornerRadius = 6
        SearchBarView.layer.borderColor = UIColor(white: 112/255, alpha: 1).cgColor
        SearchBarView.layer.borderWidth = 2
        
//          getCreatorInfo(creator_name:"b")
      textFieldDidEndEditing(SearchTextField)
        
     
        SearchTextField.delegate = self
//        getCreatorCnt()
  //      callCount()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       textFieldDidEndEditing(SearchTextField)
        
       
    }
    
    
//    func getCreatorCnt(){
//
//        CreatorCountService.shared.getCreatorCnt() {
//            [weak self]
//            data in
//
//            guard let `self` = self else { return }
//
//            switch data {
//            case .success(let res):
//
//                let url = CreatorCntURL
//
//
//                let response = try String(contentsOf: url!)
//
//
//
//                self.creatorAllCnt.text = response
//
//           //     self.countList = res as! [Count]
//             // self.creatorAllCnt = String(countList)
//
//
//                break
//            case .requestErr(let err):
//                print(".requestErr(\(err))")
//                break
//            case .pathErr:
//                // 대체로 경로를 잘못 쓴 경우입니다.
//                // 오타를 확인해보세요.
//                print("count 경로 에러")
//                break
//            case .serverErr:
//                // 서버의 문제인 경우입니다.
//                // 여기에서 동작할 행동을 정의해주시면 됩니다.
//                print("count 서버 에러")
//                break
//            case .networkFail:
//           //     self.simpleAlert(title: "통신 실패", message: "네트워크 상태를 확인하세요.")
//                break
//            }
//        }
//    }
//    func callCount() {
//
//        do {

//            let url = URL(string: "http://13.125.32.90:3000/api/creators/allcreatorcnt")
//
//            let response = try String(contentsOf: url!)
//            print(response)
//
//            self.creatorAllCnt.text = response.self.creatorAllCnt
////
//
//        }catch let e as NSError {
//
//            print(e.localizedDescription)
//
//        }
//
//    }
    
    
    
    
//    func getCreatorInfo(creator_name: String) {
//
//        CreatorSearchService.shared.getCreatorInfo(creator_name: creator_name) {
//            [weak self]
//            data in
//
//            guard let `self` = self else { return }
//
//            switch data {
//            case .success(let res):
//
//                self.resultList = res as! [Result]
//                self.ResearchTableView.reloadData()
//
//                break
//            case .requestErr(let err):
//                print(".requestErr(\(err))")
//                break
//            case .pathErr:
//                // 대체로 경로를 잘못 쓴 경우입니다.
//                // 오타를 확인해보세요.
//                print("경로 에러")
//                break
//            case .serverErr:
//                // 서버의 문제인 경우입니다.
//                // 여기에서 동작할 행동을 정의해주시면 됩니다.
//                print("서버 에러")
//                break
//            case .networkFail:
//               // self.simpleAlert(title: "통신 실패", message: "네트워크 상태를 확인하세요.")
//                break
//            }
//        }
//    }// func

    
}

extension ResultViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let data = SearchTextField.text  else {return }
            
            delegate?.sendData(data: data)
            
  
//        guard let creator = SearchTextField.text else {return }
        
        
//       print(SearchTextField.text)
//        data.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        CreatorSearchService.shared.getCreatorInfo(creatorName: "\(data)"){

            data in
            switch data {

            case .success(let res):
                self.resultList = res as! [Result]
                self.ResearchTableView.reloadData()

            case .requestErr(let err):
         //       self.simpleAlert(title: "로그인 실패", message: err as! String)
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
           //     self.simpleAlert(title: "통신 실패", message: "네트워크 상태를 확인하세요.")
                break
            }
        }


    }
   
    
    
    
}







extension ResultViewController: UITableViewDataSource {

    
    // UITalbeView 에 얼마나 많은 리스트를 담을 지 설정합니다.
    // 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
      //  SearchCnt.isHidden = true
        self.CreatorCnt.text = String(resultList.count)
        return resultList.count
        
        
        
    }
    

    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
  //      ResearchTableView.isHidden = true

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







