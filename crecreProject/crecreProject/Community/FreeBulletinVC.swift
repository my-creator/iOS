//
//  FreeBulletinVC.swift
//  crecreProject
//
//  Created by 하준혁 on 2019. 7. 2..
//  Copyright © 2019년 하준혁. All rights reserved.
//

import UIKit

class FreeBulletinVC: UIViewController {

    @IBOutlet weak var DBTable: UITableView!
    
    var postList: [post] = []
    var navbarTitle: String?
    var imageSection: UIImage!
    var hotImageSection: UIImage!
    var titleLabel: String?
    var info: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBTable.separatorInset = UIEdgeInsets.init(top: 0,left: 28,bottom: 0,right: 27)

        
        switch navbarTitle {
            
        case "자유게시판":
            print("자유게시판이 로드되었습니다")
            DBTable.dataSource = self
            DBTable.delegate = self
            setPostData()
        default:
            print("다른게시판이 로드되었습니다")
            self.navigationController?.navigationBar.topItem?.title = ""
            self.title = navbarTitle
            setContentData().self
            
        }
    }
    
    func setContentData(){
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return postList.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = DBTable.dequeueReusableCell(withIdentifier: "FreeBulletinTableCell") as! FreeBulletinTableCell
            cell.HotImage.image = hotImageSection
            cell.postImage.image = imageSection
            cell.titleLabel.text = titleLabel
            cell.infoLabel.text = info
            print("데이터를 주입합니다")
            
            return cell
        }

    }
        
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
        
        if let index = DBTable.indexPathForSelectedRow {
            DBTable.deselectRow(at: index, animated: true)
        }
    }
}



extension FreeBulletinVC: UITableViewDelegate {
    /*
     didSelectRowAt 은 셀을 선택했을때 어떤 동작을 할 지 설정할 수 있습니다.
     여기서는 셀을 선택하면 그에 해당하는 MusicDetailVC 로 화면전환을 합니다.
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 아래의 과정들은 1, 2차 세미나의 화면 전환 간 데이터 전달과 같습니다.
        let dvc = storyboard?.instantiateViewController(withIdentifier: "FBDetailVC") as! FBDetailVC
        // 맨 아래 extension 에 musicList 배열에 저장하는 부분이 있습니다.
        // 해당하는 인덱스의 Model 을 저장합니다.
        let post = postList[indexPath.row]
        
        dvc.detailImage = post.postImage
        dvc.postTitle = post.postTitle
        
        //        dvc.albumImg = music.albumImg
        //        dvc.musicTitle = music.musicTitle
        //        dvc.singer = music.singer
        
        // push 방식으로 화면을 전환합니다.
        navigationController?.pushViewController(dvc, animated: true)
    } // 여기까지 보셨다면 잠깐 다시 위의 viewDidDisappear로!
    
    // canMoveRowAt은 테이블뷰의 row의 위치를 이동할 수 있는지 없는지 설정합니다.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    /*
     moveRowAt은 테이블 뷰의 row 의 위치가 변화하였을 때, 원하는 작업을 해줄 수 있습니다.
     지금 이 프로젝트에서는 editing mode 에서 row 를 변화 시킴에 따라 이 함수가 실행됩니다.
     */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        /*
         테이블 뷰 의 row 를 변화시키면 그에 따라 대응되는 모델(데이터)도 변화시켜주어야 합니다.
         sourceIndexPath와 destinationIndexPath를 통해 이동을 시작한 index와 새롭게 설정된 index를 가져올 수 있습니다.
         */
        let movingIndex = postList[sourceIndexPath.row]
        
        postList.remove(at: sourceIndexPath.row)
        postList.insert(movingIndex, at: destinationIndexPath.row)
    }
    /*
     commit editingStyle 은 테이블뷰가 edit 된 스타일에 따라 이벤트를 설정할 수 있습니다.
     여기서는 editing mode 에서 한개의 row 를 delete 하였을 경우에 대한 동작을 설정하였습니다.
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            postList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


extension FreeBulletinVC: UITableViewDataSource {
    
    // UITalbeView 에 얼마나 많은 리스트를 담을 지 설정합니다.
    // 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postList.count
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = DBTable.dequeueReusableCell(withIdentifier: "FreeBulletinTableCell") as! FreeBulletinTableCell
        // 이 부분은 내가 보는 view만 데이터에서 로딩이 되어지게 하는 부분이다. 적은 메모리로도 많은 데이터를 핸들링하기 위한 코드
        // 데이터를 내가 보는 부분만 동적 할당을 하기 위해서 짜놓은 코드이다.
        // as 는 캐스팅을 하는 부분이다.
        
        let post = postList[indexPath.row]
        
        cell.postImage.image = post.postImage
        cell.HotImage.image = post.postHotImage
        cell.titleLabel.text = post.postTitle
        cell.infoLabel.text = post.postInfo
        
        //        @IBOutlet weak var hotPostImage: UIImageView!
        //        @IBOutlet weak var hotPostTitle: UILabel!
        //        @IBOutlet weak var hotPostInfo: UILabel!
        
        return cell
    }
}


extension FreeBulletinVC{
    func setPostData() {
        //        let music1 = Music(title: "삐삐", singer: "아이유", coverName: "album_iu")
        let post1 = post(title: "맛집추천", info: "김리뷰", coverName: "puppy", coverNameInfo: "icHot")
        let post2 = post(title: "개존맛탱집", info: "타코리뷰", coverName: "puppy", coverNameInfo: "icHot")
        
        postList = [post1, post2]
    }
}

