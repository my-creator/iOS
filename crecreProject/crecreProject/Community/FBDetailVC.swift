//
//  FBDetailVC.swift
//  crecreProject
//
//  Created by 황채연 on 10/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class FBDetailVC: UIViewController {
    
    var commentList: [comment] = []

    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var FBDetailTV: UITableView!
    var detailImage: UIImage?
    var postTitle: String?
    
    
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postCommentCount: UIButton!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var thumbsUpBtn: UIButton!
    @IBOutlet weak var thumbsDownBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FBDetailTV.alwaysBounceVertical = false;

        
        let image = UIImage(named: "navigationbar")
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        setContents()
        setCommentData()
        
        headerView.addBottomBorderWithColor(color: .gray, width: 0.4)
        FBDetailTV.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func setContents(){
        postImage.image = detailImage
        postTitleLabel.text = postTitle
        
    }
    
}

extension FBDetailVC: UITableViewDataSource {
    
    // UITalbeView 에 얼마나 많은 리스트를 담을 지 설정합니다.
    // 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentList.count
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = FBDetailTV.dequeueReusableCell(withIdentifier: "DetailTVC") as! DetailTVC
        // 이 부분은 내가 보는 view만 데이터에서 로딩이 되어지게 하는 부분이다. 적은 메모리로도 많은 데이터를 핸들링하기 위한 코드
        // 데이터를 내가 보는 부분만 동적 할당을 하기 위해서 짜놓은 코드이다.
        // as 는 캐스팅을 하는 부분이다.
        
        let comment = commentList[indexPath.row]
        
        cell.commentContent.text = comment.commentContent
        cell.commentInfo.text = comment.commentInfo
        cell.commentName.text = comment.commentName
        
        return cell
    }
}

extension FBDetailVC {
    func setCommentData() {
        //        let music1 = Music(title: "삐삐", singer: "아이유", coverName: "album_iu")
        let comment1 = comment(content: "댓글1", name: "김리뷰", info: "10초전")
        let comment2 = comment(content: "뎃글2", name: "타코리뷰", info: "15초전")
        
        commentList = [comment1, comment2]
    }
}

extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}
