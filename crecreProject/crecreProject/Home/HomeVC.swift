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
    
    @IBAction func ShowOnetoFive(_ sender: Any) {

    }
    
    @IBAction func ShowSixToTen(_ sender: Any) {
        
             }
    var rankList: [Rank] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        setRankData()
       
        
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
        


        
    }
    

    @IBAction func nexyButton(_ sender: Any) {
        if let transition = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController"){
            
            transition.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            self.present(transition, animated: true, completion: nil)
        }
    }
    

}
// UITableViewDataSource 를 채택합니다.
extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RankCollectionView.dequeueReusableCell(withReuseIdentifier: "RankCell", for: indexPath) as! RankViewCell
        let rank = rankList[indexPath.row]
        
        cell.RankLabel.text = rank.RankLabel
        cell.RankTitleLabel.text = rank.RankTitleLabel
        cell.RankVariationLabel.text = rank.RankVariationLabel
        cell.UpDownImage.image = rank.UpdownImage
        
        return cell
    }
    
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
    func setRankData() {
        let rank1 = Rank(rank: "1", ranktitle:"크리크리", rankvariation: "23422", updown : "ic_up")
        let rank2 = Rank(rank: "2", ranktitle:"D-3", rankvariation: "2214", updown : "icn_down")
        let rank3 = Rank(rank: "3", ranktitle:"ios", rankvariation: "3454", updown : "ic_up")
        let rank4 = Rank(rank: "4", ranktitle:"술팟", rankvariation: "312", updown : "ic_up")
        let rank5 = Rank(rank: "5", ranktitle:"제발되라", rankvariation: "1334", updown : "icn_down")
      
        let vote = Vote(image: "btn_check", closeddate: "2일후 마감", title: "크리크리에서 술팟장은?", detailtitle: "나도 홍삼이 보고싶다")
        
        rankList = [rank1, rank2, rank3, rank4, rank5]
      
    }
 
}


