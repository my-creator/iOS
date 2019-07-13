//
//  CommuChildVC1.swift
//  crecreProject
//
//  Created by 하준혁 on 03/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CommuChildVC2: UIViewController, IndicatorInfoProvider{
    
    @IBOutlet weak var Child2TableView: UITableView!
    var postList: [post] = []
    var navbarTitle: String = "인기글"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Child2TableView.separatorInset = UIEdgeInsets.init(top: 0,left: 28,bottom: 0,right: 27)
        
        Child2TableView.dataSource = self
        setPostData2()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: navbarTitle)
    }
    
}




//extension CommuChildVC2: UITableViewDelegate {
//    /*
//     didSelectRowAt 은 셀을 선택했을때 어떤 동작을 할 지 설정할 수 있습니다.
//     여기서는 셀을 선택하면 그에 해당하는 MusicDetailVC 로 화면전환을 합니다.
//     */
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let dvc = storyboard?.instantiateViewController(withIdentifier: "FreeBulletinVC") as! FreeBulletinVC
//        let post = postList[indexPath.row]
//        
//        
//        dvc.navbarTitle = navbarTitle
//        dvc.imageSection = post.postImage
//        dvc.titleLabel = post.postTitle
//        dvc.info = post.postInfo
//
//        navigationController?.pushViewController(dvc, animated: true)
//    }
//    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        
//        return true
//    }
//    
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        
//        /*
//         테이블 뷰 의 row 를 변화시키면 그에 따라 대응되는 모델(데이터)도 변화시켜주어야 합니다.
//         sourceIndexPath와 destinationIndexPath를 통해 이동을 시작한 index와 새롭게 설정된 index를 가져올 수 있습니다.
//         */
//        let movingIndex = postList[sourceIndexPath.row]
//        
//        postList.remove(at: sourceIndexPath.row)
//        postList.insert(movingIndex, at: destinationIndexPath.row)
//    }
//    /*
//     commit editingStyle 은 테이블뷰가 edit 된 스타일에 따라 이벤트를 설정할 수 있습니다.
//     여기서는 editing mode 에서 한개의 row 를 delete 하였을 경우에 대한 동작을 설정하였습니다.
//     */



extension CommuChildVC2: UITableViewDataSource {
    
    // UITalbeView 에 얼마나 많은 리스트를 담을 지 설정합니다.
    // 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postList.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            postList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    
    
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Child2TableView.dequeueReusableCell(withIdentifier: "Child2TVC") as! Child2TVC
        // 이 부분은 내가 보는 view만 데이터에서 로딩이 되어지게 하는 부분이다. 적은 메모리로도 많은 데이터를 핸들링하기 위한 코드
        // 데이터를 내가 보는 부분만 동적 할당을 하기 위해서 짜놓은 코드이다.
        // as 는 캐스팅을 하는 부분이다.
        
        let post = postList[indexPath.row]
        
        cell.ImageSection.image = post.postImage
        cell.titleLabel.text = post.postTitle
        cell.infoLabel.text = post.postInfo
        

        
        return cell
    }
}

extension CommuChildVC2 {
    func setPostData2() {
        
        let post1 = post(title: "술 제일 잘마실 것같은 뷰티 유튜버", info: "시온조교", coverName: "img8", coverNameInfo: "icHot")
        let post2 = post(title: "차은우가 브이로그찍으면 이런 느낌?", info: "은우내꺼야다나와", coverName: "img2", coverNameInfo: "icHot")
         let post3 = post(title: "요즘 외모 리즈찍고있는 세경씨", info: "빵꾸똥꾸", coverName: "img6", coverNameInfo: "icHot")
        let post4 = post(title: "와..브이로그계의 배쓰 강동원", info: "동원참치", coverName: "img3", coverNameInfo: "icHot")
        let post5 = post(title: "백종원레시피로 대용량음식 만들기", info: "조보화씨 나와봐유", coverName: "img4", coverNameInfo: "icHot")
        let post6 = post(title: "퇴근 후 힐링영상 꼭 보세요ㅜㅜ", info: "타코리뷰", coverName: "img2", coverNameInfo: "icHot")
        
        postList = [post1, post2,post3,post4,post5,post6 ]
    }
}
