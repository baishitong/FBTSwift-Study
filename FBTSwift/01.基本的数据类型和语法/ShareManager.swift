//
//  ShareManager.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/26.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class ShareManager: NSObject {
    /*
     // 方法一:
     private static let instance = APPManager()
     
     // 定义类方法,返回当前单例类对象
     class func getShareInstance() ->APPManager {
     
     return instance
     }
     
     // 私有化init方法<需要override重写>
     private override init() {
     
     }
     */
    // 方法二:
    static let instance = ShareManager()
    // 私有化init方法
    fileprivate override init() {
        
    }

}
