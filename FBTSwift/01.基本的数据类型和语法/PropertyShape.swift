//
//  PropertyShape.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/25.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class PropertyShape: Shape {
    
    var sideLength:Double = 0.0
    
//    “注意EquilateralTriangle类的构造器执行了三步：”
//    “设置子类声明的属性值
//    调用父类的构造器
//    改变父类定义的属性值。其他的工作比如调用方法、getters 和 setters 也可以在这个阶段完成。”
    
    
    init(sideLength:Double, name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
//    “在perimeter的 setter 中，新值的名字是newValue。你可以在set之后显式的设置一个名字。”
    
    
    var perimeter:Double {
        
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
        
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }

}
