//
//  CommunityController.swift
//  crecreProject
//
//  Created by 하준혁 on 2019. 7. 1..
//  Copyright © 2019년 하준혁. All rights reserved.
//

import UIKit
import Hue
import XLPagerTabStrip

class CommunityController: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var likeBoard: UITableView!
    
    var postList: [likePost] = []
    
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    let whiteFive = UIColor(white: 247.0 / 255.0, alpha: 1.0)
    let lightMagenta = UIColor(red: 1.0, green: 87.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    let greyish =  UIColor(white: 164.0 / 255.0, alpha: 1.0)
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = whiteFive //버튼 사이의 간격
        settings.style.buttonBarItemBackgroundColor =  whiteFive // 버튼전체 색
        settings.style.selectedBarBackgroundColor = lightMagenta //밑에 바
//        settings.style.buttonBarItemFont = UIFont(name: "NotoSansCJKkr-Medium", size: 14.0)!
        settings.style.selectedBarHeight = 2.0 //바 높이
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .lightGray //바 우측상단 버튼
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = self?.greyish
            newCell?.label.textColor = self?.lightMagenta
        }
        
        

        
        
        
        let gradient = [UIColor(red:1.00, green:0.56, blue:0.99, alpha:1.0), UIColor(red:0.17, green:0.94, blue:0.94, alpha:1.0)].gradient()
        
        let secondGradient = [UIColor(red:1.00, green:0.56, blue:0.99, alpha:1.0), UIColor(red:0.17, green:0.94, blue:0.94, alpha:1.0)].gradient {
            gradient in gradient.locations = [0.25, 1.0]
            return gradient
        }
        
//        var realGradient = view.layer.addSublayer(gradient)
        
        
//        self.navigationController?.navigationBar.barTintColor = gradient
        
        
//        likeBoard.delegate = self
        likeBoard.dataSource = self
        setPostData()
        }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child2")
        return [child_1, child_2]
    }
        
        
    
}




extension CommunityController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = likeBoard.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        //  발생하는 에러코드     Value of optional type 'UILabel?' must be unwrapped to refer to member 'text' of wrapped base type 'UILabel'
        // 이 부분은 내가 보는 view만 데이터에서 로딩이 되어지게 하는 부분이다. 적은 메모리로도 많은 데이터를 핸들링하기 위한 코드
        // 데이터를 내가 보는 부분만 동적 할당을 하기 위해서 짜놓은 코드이다.
        // as 는 캐스팅을 하는 부분이다.
        
        let post = postList[indexPath.row]
        
        cell.postTitle.text = post.postTitle
        
        return cell
    }
}


//extension CommunityController: UITableViewDelegate {
//    /*
//     didSelectRowAt 은 셀을 선택했을때 어떤 동작을 할 지 설정할 수 있습니다.
//     여기서는 셀을 선택하면 그에 해당하는 MusicDetailVC 로 화면전환을 합니다.
//     */
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // 아래의 과정들은 1, 2차 세미나의 화면 전환 간 데이터 전달과 같습니다.
////        let dvc = storyboard?.instantiateViewController(withIdentifier: "MusicDetailVC") as! MusicDetailVC
//        // 맨 아래 extension 에 musicList 배열에 저장하는 부분이 있습니다.
//        // 해당하는 인덱스의 Model 을 저장합니다.
//        let post = postList[indexPath.row]
//
//        dvc.albumImg = music.albumImg
//        dvc.musicTitle = music.musicTitle
//        dvc.singer = music.singer
//
//        // push 방식으로 화면을 전환합니다.
//        navigationController?.pushViewController(dvc, animated: true)
//    } // 여기까지 보셨다면 잠깐 다시 위의 viewDidDisappear로!
//
//    // canMoveRowAt은 테이블뷰의 row의 위치를 이동할 수 있는지 없는지 설정합니다.
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//
//        return true
//    }
//
//    /*
//     moveRowAt은 테이블 뷰의 row 의 위치가 변화하였을 때, 원하는 작업을 해줄 수 있습니다.
//     지금 이 프로젝트에서는 editing mode 에서 row 를 변화 시킴에 따라 이 함수가 실행됩니다.
//     */
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//
//        /*
//         테이블 뷰 의 row 를 변화시키면 그에 따라 대응되는 모델(데이터)도 변화시켜주어야 합니다.
//         sourceIndexPath와 destinationIndexPath를 통해 이동을 시작한 index와 새롭게 설정된 index를 가져올 수 있습니다.
//         */
//        let movingIndex = musicList[sourceIndexPath.row]
//
//        musicList.remove(at: sourceIndexPath.row)
//        musicList.insert(movingIndex, at: destinationIndexPath.row)
//    }
//    /*
//     commit editingStyle 은 테이블뷰가 edit 된 스타일에 따라 이벤트를 설정할 수 있습니다.
//     여기서는 editing mode 에서 한개의 row 를 delete 하였을 경우에 대한 동작을 설정하였습니다.
//     */
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            musicList.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
//}

extension CommunityController {
    
    func setPostData() {
        
        let post1 = likePost(title: "title1")
        let post2 = likePost(title: "title2이다")
        
        postList = [post1,post2]
    }
}

