//
//  FBDetailVC.swift
//  crecreProject
//
//  Created by 황채연 on 10/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class FBDetailVC: UIViewController {
    
    var detailImage: UIImage?
    var postTitle: String?
    
    
    
    @IBOutlet weak var postTitle2: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postCommentCount: UIButton!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var postThumbsUp: UILabel!
    @IBOutlet weak var postThumbsDown: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
        // Do any additional setup after loading the view.
    }
    
    func setContents(){
        postImage.image = detailImage
        postTitle2.text = postTitle
        
    }
    
}
