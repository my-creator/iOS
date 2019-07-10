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

class VoteVC: ButtonBarPagerTabStripViewController {
    
    
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    let whiteFive = UIColor(white: 247.0 / 255.0, alpha: 1.0)
    let lightMagenta = UIColor(red: 1.0, green: 87.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    let greyish =  UIColor(white: 164.0 / 255.0, alpha: 1.0)
  let medium =  UIFont(name: "NotoSansCJKkr-Medium", size: 14.0)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = whiteFive //버튼 사이의 간격
        settings.style.buttonBarItemBackgroundColor =  whiteFive // 버튼전체 색
        settings.style.selectedBarBackgroundColor = lightMagenta //밑에 바
      settings.style.buttonBarItemFont = medium
        settings.style.selectedBarHeight = 2.0 //바 높이
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .lightGray //바 우측상단 버튼
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
       
        
        
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = self?.greyish //누르지않은 탭 색
         
            newCell?.label.textColor = self?.lightMagenta // 누른 탭 색
        }
        
    
     
    }//didload()
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
 
    
    }
    
    
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Votechild1")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Votechild2")
        return [child_1, child_2]
    }
    
    
    
    
}





