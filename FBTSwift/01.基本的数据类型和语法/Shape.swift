//
//  Shape.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/25.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class Shape: NSObject {
    var numberOfSides = 0
    var name:String
    
    init(name:String) {
        self.name = name
    }
//    “注意self被用来区别实例变量。当你创建实例的时候，像传入函数参数一样给类传入构造器的参数。每个属性都需要赋值——无论是通过声明（就像numberOfSides）还是通过构造器（就像name）。
//    
//    如果你需要在删除对象之前进行一些清理工作，使用deinit创建一个析构函数。”
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
}
