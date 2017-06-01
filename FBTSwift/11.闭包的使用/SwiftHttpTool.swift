//
//  SwiftHttpTool.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/1.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit
import Foundation
class SwiftHttpTool: NSObject {

    var callBack :((_ jsonData : String) -> ())?
    
    func loadData(callBack : @escaping (_ jsonData : String) -> ()) {
    
        self.callBack = callBack//测试循环引用
        DispatchQueue.global().async() {
            print("swift的写法 真坑，发送网络请求\(Thread.current)")
            DispatchQueue.main.sync {
                print("获取到数据，回调\(Thread.current)")
                callBack("jsonData")
            }
        }
    }
}
