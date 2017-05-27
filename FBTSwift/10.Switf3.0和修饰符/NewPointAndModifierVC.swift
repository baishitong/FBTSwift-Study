//
//  NewPointAndModifierVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/27.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class NewPointAndModifierVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Swift修饰和3.0"
        // 1.private访问级别所修饰的属性或者方法只能在当前类里访问。extension定义的方法也不能访问
        test()
//        test1()
        // 2.fileprivate访问级别所修饰的属性或者方法在当前的Swift源文件里可以访问。
        test2()
        //3.internal（默认访问级别，internal修饰符可写可不写）internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
         test3()
        // 4.public可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。
        test4()
        // 5.open可以被任何人使用，包括override和继承。
        test5()
        
        //MARK: Swift3新特性汇总
        // 1.弃用 ++ 与 -- 操作符,使用复合加法运算（+=）与减法运算（-=），或者使用普通的加法运算（+）与减法运算（-）实现同样的功能.
        var i = 2
//        i++
        i += 1
        i += 2   //i = i + 2
        i -= 2   //i = i - 2
        print("i = \(i)")
        // 2.废除C语言风格的for循环
//        for int i = 0,i<10,i++
        for i in 1...10 {
            print(i)
        }
        
        (1...10).forEach { (j) in
            
            print("这是什么意思？？？j = \(j)")
        }
        
        //下面的崩溃
//        (10...1).forEach { (j) in
//            
//            print("倒叙可以吗？？？j = \(j)")
//        }
        
        
        // 3.移除函数参数的 var 标记
        /*
        苹果又给出了一种不用给第一个参数带标签的解决方案。即在第一个参数前面加上一个下划线。
        （不过这个只是方便我们代码从 Swift2 迁移到 Swift3 的一个折中方案，可以的话还是建议将所有的参数都带上标签。）
         */
        add(a: "问自己的心")
        // 4.Selector 不再允许使用 String
        // 5.key-path不再只能使用String
        let user = User()
        user.name = "冯柏通该结婚了"
        user.age = 24
         // 使用KVC取值,注意#keyPath里是  类名.属性
        let name = user.value(forKeyPath: #keyPath(User.name))
        print(name ?? String())
        user.setValue("xixixi", forKeyPath: #keyPath(User.name))
        print("name = \(user.name)")
        
         // 6.在 Swift 3 中，π 提供了 Float，Double 与 CGFloat 三种形式（Float.pi、Double.pi、CGFloat.pi），所以求周长还可以这么写
        let r = 3.0
        let circumference = 2 * Double.pi * r
//        let circumference2 = 2.0 * Float.pi * r
        let circumference3 = 2 * .pi * r
        print("circumference = \(circumference)")
        print("circumference3 = \(circumference3)")
        // 7.简化GCD的写法
        let queue = DispatchQueue(label: "swift3")
        queue.async {
            print("简化GCD的写法")
        }
        // 8.数组排序：sort()与sorted()
        /*
         sort() 是直接对目标数组进行排序。sorted() 是返回一个排序后的数组，原数组不变。
         */
        var array = [1.5, 3, 4, 9, 2, 5]
        let sortedArray = array.sorted()
        print(array)
        print(sortedArray)
        
        array.sort()
        print(array)
      
        // 9.reversed()与enumerated()过去 reverse() 方法实现数组反转，enumerate() 方法实现遍历。现这两个方法都加上 ed 后缀（reversed、enumerated）
        for i in (1...10).reversed() {
            print(i)
        }
        
        let arr = [1, 3, 5, 6, 2, 4]
//        数组是有index的就是位置  value就是值。
        for (index,value) in arr.enumerated() {
              print("index \(index)  value = \(value)")
        }
        // 10.@discardableResult
        //在 Swift 3 中，如果一个方法有返回值。而调用的时候没有接收该方法的返回值，Xcode 会报出警告，告诉你这可能会存在潜在问题。
        print(sum(a: 3, b: 4))
        

    }
 
    private func test() {
        
        print("test")
    }
    
    func add(a: String) {
        
        print("a = \(a)")
    }
    
    @discardableResult
    func sum(a: Int, b: Int) -> Int {
        
        return a + b
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension NewPointAndModifierVC {

    private func test1() {
    
        print("无法打印的text1")
    }
    
    fileprivate func test2() {
        
        print("test2")
    }
    
    internal func test3() {
        
        print("test3")
    }
    
    public func test4() {
        
        print("test4")
    }
    
    open func test5() {
        
        print("test5")
    }
}

class User: NSObject {
    var name: String?
    var age: Int?
}
