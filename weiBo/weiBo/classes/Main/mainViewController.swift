//
//  mainViewController.swift
//  weiBo
//
//  Created by zijia on 2016/9/30.
//  Copyright © 2016年 zijia. All rights reserved.
//

import UIKit

class mainViewController: UITabBarController {

    // UIButton 构造方法
    fileprivate lazy var composeBtn = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setUpComposeBtn()
    }

}

extension mainViewController{
    fileprivate func setUpComposeBtn(){
        
        tabBar.addSubview(composeBtn)
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        composeBtn.addTarget(self, action: #selector(mainViewController.composeBtnClick), for: .touchUpInside)
    }
}

extension mainViewController{
    @objc fileprivate func composeBtnClick(){
        
        print("adfasdfa")
    }
}








