//
//  writeVC.swift
//  crecreProject
//
//  Created by 하준혁 on 12/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import UIKit

class writeVC: UIViewController {
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var camBtn: UIButton!
    @IBOutlet weak var annoyBtn: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.addBottomBorderWithColor(color: .gray, width: 0.4)
        bottomView.addTopBorderWithColor(color: .gray, width: 0.4)
        contentTextView.text = "내용을 입력하세요"
        contentTextView.textColor = UIColor.lightGray
        
        camBtn.layer.borderWidth = 0.4
        annoyBtn.layer.borderWidth = 0.4

        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextView.textColor == UIColor.lightGray {
            contentTextView.text = nil
            contentTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if contentTextView.text.isEmpty {
            contentTextView.text = "내용을 입력하세요"
            contentTextView.textColor = UIColor.lightGray
        }
    }


}



