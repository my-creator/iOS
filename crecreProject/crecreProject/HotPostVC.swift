//
//  HotPostVC.swift
//  crecreProject
//
//  Created by 하준혁 on 04/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class HotPostVC: UIViewController {
    
    var hotPostTitle: String!
    var hotPostIamge: UIImage?

    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var postingTime: UILabel!
    @IBOutlet weak var commentCounts: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var postThumbsUp: UILabel!
    @IBOutlet weak var postThumbsDown: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
    }
    

    func setContents(){
        postImage.image = hotPostIamge
        postTitle.text = hotPostTitle
        
    }

}
