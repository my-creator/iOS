//
//  HomeVC.swift
//  crecreProject
//
//  Created by 황채연 on 03/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var SearchView: UIView!
    
    
    @IBOutlet weak var SearchTextField: UITextField!
    
    @IBOutlet weak var RankCollectionView: UICollectionView!
    
    @IBOutlet weak var HomeVoteImage: UIImageView!
    
    @IBOutlet weak var CloseDateLabel: UILabel!
    
    @IBOutlet weak var HomeVoteTitle: UILabel!
    
    @IBOutlet weak var HomeVoteDetailTitle: UILabel!
    
    @IBOutlet weak var HomeVoteCollectionView: UICollectionView!
    
    @IBOutlet weak var VoteButton: UIButton!
    
    @IBOutlet weak var VoteBackgroundView: UIView!
    
    
  
    var rankList: [Rank] = []
    var voteList: [Vote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        getRank()
       
        
        RankCollectionView.delegate = self as? UICollectionViewDelegate
        RankCollectionView.dataSource = self as UICollectionViewDataSource
       SearchView.layer.cornerRadius = 6
        SearchView.layer.borderWidth = 2
        SearchView.layer.borderColor = UIColor(white: 112/255, alpha: 1).cgColor
        
        let image = UIImage(named: "creator" )
        HomeVoteImage.image = image
       HomeVoteImage.layer.masksToBounds = true
        HomeVoteImage.layer.cornerRadius = 10
        
        
        CloseDateLabel.layer.masksToBounds = true
        CloseDateLabel.layer.cornerRadius = 12

        VoteBackgroundView.layer.cornerRadius = 8
        VoteBackgroundView.layer.shadowColor  = UIColor(white: 0.0, alpha: 1.0).cgColor
        VoteBackgroundView.layer.shadowOpacity = 0.1
        VoteBackgroundView.layer.shadowOffset = .init(width: 0, height: 4)
        VoteBackgroundView.layer.shadowRadius = 8
        
        setVoteData()
        
        HomeVoteCollectionView.dataSource = self as! UICollectionViewDataSource
        HomeVoteCollectionView.delegate = self as! UICollectionViewDelegate
        
        
//        HomeVoteCollectionView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(gesture:))))
//
  }
//

    @IBAction func nexyButton(_ sender: Any) {
        if let transition = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController"){
            
            transition.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            self.present(transition, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func funcBtnAction(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = !sender.isSelected
        }
        
        switch sender.titleLabel?.text {
        case "1~5위":

            getRank()

            break
        case "6~10위":
            getRank()
            break
        
        default:
            getRank()
            break
        }
    }
    
    
    func getRank() {
        
       RankService.shared.getRank() {
            [weak self]
            data in
            guard let `self` = self else { return }
            switch data {
            case .success(let res):
                
                self.rankList = res as! [Rank]
                self.RankCollectionView.reloadData()
                
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
          //      self.simpleAlert(title: "통신 실패", message: "네트워크 상태를 확인하세요.")
                break
            }
        }
    }// func
    
  
        
        
    }





// UITableViewDataSource 를 채택합니다.
extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return rankList.count
        return voteList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RankCollectionView.dequeueReusableCell(withReuseIdentifier: "RankCell", for: indexPath) as! RankViewCell
        let rank = rankList[indexPath.row]
        
        cell.RankLabel.text = String(rank.ranking)
        cell.RankTitleLabel.text = rank.creatorName
        cell.RankVariationLabel.text = String(rank.searchCnt)
       cell.UpDownImage = UIImage(contentsOfFile:"ic_up")
        
        return cell
        
        
        let cill = RankCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeVoteCell", for: indexPath) as! HomeVoteCollectionViewCell
        let vote = voteList[indexPath.row]
        
        cill.OptionClassImage.image = vote.classImg
       cill.OptionTitleImage.image = vote.titleImg
        cill.OptionTitleLabel.text = vote.optionTitle
        
        return cill
        
        
        
        
    }
    
    
//
//
//    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = RankCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeVoteCell", for: indexPath) as! HomeVoteCollectionViewCell
//        let vote = voteList[indexPath.row]
//
//        cell.OptionClassImage.image = vote.classImg
//        cell.OptionTitleImage.image = vote.titleImg
//        cell.OptionTitleLabel.text = vote.optionTitle
//
//        return cell
//    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    // Collection View Cell 의 width, height 를 지정할 수 있습니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let width: CGFloat = view.frame.width
      let height: CGFloat = (view.frame.height / 20)

       return CGSize(width: width, height: height)
    }




}

extension HomeVC {
    func setVoteData() {
        let vote1 = Vote(classimage: "icn_class3_3x", titleImage: "", titleoption: "술팟장")
        let vote2 = Vote(classimage: "icn_class4_3x", titleImage: "", titleoption: "야팟장")
        let vote3 = Vote(classimage: "icn_class2_3x", titleImage: "", titleoption: "홍삼")
        let vote4 = Vote(classimage: "icn_class3_4x", titleImage: "", titleoption: "시온조교")
        
        
      
        voteList = [vote1, vote2, vote3, vote4,]
      
    }
 
}


