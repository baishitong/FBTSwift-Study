//
//  HomeTypeTitle.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/12.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class HomeTypeTitle: NSObject {
    var title : String = ""
    var type  : Int = 0
    //  还不清楚为什么下面的要这么写
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
