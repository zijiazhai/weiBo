//
//  User.swift
//  weiBo
//
//  Created by zijia on 2017/1/25.
//  Copyright © 2017年 zijia. All rights reserved.
//

import UIKit

class User: NSObject {
    
    // MARK:- 属性
    var profile_image_url : String?     //用户头像
    var screen_name : String?           //用户昵称
    
    var verified_type : Int = -1 {      //用户认证类型
        didSet{
            switch verified_type {
            case 0:
                verifiedImage = UIImage(named: "avatar_vip")
            case 2, 3, 5:
                verifiedImage = UIImage(named: "avatar_enterprise_vip")
            case 220:
                verifiedImage = UIImage(named: "avatar_grassroot")
            default:
                verifiedImage = nil
            }
        }
    }
    
    var mbrank : Int = 0 {              //用户会员等级
        didSet{
            if mbrank > 0 && mbrank <= 6 {
                vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            }
        }
    }
    
    // MARK:- 对数据处理
    var verifiedImage : UIImage?
    var vipImage : UIImage?
    
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
