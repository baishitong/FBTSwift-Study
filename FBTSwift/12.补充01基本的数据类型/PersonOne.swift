//
//  PersonOne.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/31.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

//MARk: 类的定义； 创建类对应的对象； 给类的属性赋值，包含直接赋值和 通过 kvc赋值，重写 setvalue。   override重写
class PersonOne: NSObject {
    var age : Int = 0
    
//    AnyObject的可选类型转换为String的可选类型
//    用 as? String
//    as？最终返回的是一个可选类型
//    as！最终返回的是一个确定类型。
//    类似于强行解包。
//    可选绑定
//    if let tempAge = dict["age"] as? Int {
//        age  = tempAge
//    }
    
    
    
    
//    override重写,如果写的某一个方法是对父类的方法进行的 重写，前面必须 加上override。
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    //定义属性 存储属性
    var name : String?
    {
        willSet {
        
            print(name)
            print(newValue)
        }
        
        didSet {
        
            print(name)
            print(oldValue)
        }
    
    }
    
    
    
    var mathScore : Double = 0.0
    var chineseScore : Double = 0.0
    
    //定义计算属性：通过别的方式计算到结构狗的属性，而且是通过类名进行访问
    var averageScore : Double {
        return (mathScore + chineseScore) * 0.5
    }
    // 定义类属性：类属性是和整个类相关的属性，而且是通过类名进行访问
    static var courseCount : Int = 0
    
    
    override init() {
        print("-----")
    }
    //自定义构造函数
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    

}
