//
//  SwiftBlockVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/27.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class SwiftBlockVC: BaseViewController {
    
    var ocTool : OCHttpTool = OCHttpTool()
    var swiftTool : SwiftHttpTool = SwiftHttpTool()
    typealias AddBlock = (Int, Int) -> (Int)

    override func viewDidLoad() {
        super.viewDidLoad()
//        weak var weakSelf = self //swift解决循环引用
//        ocTool.loadData { (jsondata) in
//             print("在viewController拿到数据:\(String(describing: jsondata))")
////            self.view.backgroundColor = UIColor.red//测试循环引用。
//            weakSelf?.view.backgroundColor = UIColor.red//测试循环引用。
//
//        }
        /***********************/
        //第二种方式解决循环引用
//        ocTool.loadData { [weak self](jsondata) in
//              print("在viewController拿到数据:\(String(describing: jsondata))")
//              self?.view.backgroundColor = UIColor.red//测试循环引用。
//        }
        /***********************/
        //第三种方式解决循环引用第三种： [unowned self]  比较危险，如果self没有值会崩溃。 ==oc中是__unsafe__unretained 也是弱引用。oc中 __weak修饰弱引用，如果指向的对象销毁，那么指针会指向nil。而修饰的弱引用，销毁指针会依然指向原来的，产生野指针（坏内存访问），坏的地址，也是僵尸对象。不需要self加？
//        ocTool.loadData { [unowned self](jsondata) in
//            print("在viewController拿到数据:\(String(describing: jsondata))")
//            self.view.backgroundColor = UIColor.red//测试循环引用。
//        }
        
 /*******     swift的样式              ****************/
//        weak var weakSelf = self
//         [weak self]
//        [unowned self]
        swiftTool.loadData {[weak self](jsonData) in
//            weakSelf?.view.backgroundColor = UIColor.red//测试循环引用。
            self?.view.backgroundColor = UIColor.red
//           self.view.backgroundColor = UIColor.red

//
        }
        
        navigationItem.title = "闭包的使用"
        print(calAdd(100, 200))
        print(calAdd2(100, 200))
        print(calAdd3(100, 200))
        let result = calAdd6(100, 300)
        print("result = \(result)")
        testFuncation {
            print("去掉括号的尾随闭包")
        }
        testFuncation(){
            print("尾随闭包写法")
        }
        testFuncation(testBlock: {
        
            print("尾随闭包正常写法")
        })
//        testFuncation
        

    }

//    // 闭包的定义
//    let calYdd: () -> () = {
//    
//        
//    }
    let calAdd: (Int, Int) -> (Int) = {
        (a: Int, b: Int) -> Int in
        return a + b
    }
    
    //Swift可以根据闭包上下文推断参数和返回值的类型,也可以（a, b）
    let calAdd2: (Int, Int) -> (Int) = {
        a,b in
        return a + b
    }
    
    let calAdd3: (Int, Int) -> (Int) = {
        (a, b) in a + b
    }
    
    let calAdd4: () -> Int = {
        return 100 + 200
    }
    
    let calAdd5: () -> Void = {
    
        print("300")
    }
    
    //别名
    let calAdd6: AddBlock = {
        (c,d) in
        return c + d
    }
     // 尾随闭包 若将闭包作为函数最后一个参数，可以省略参数标签,然后将闭包表达式写在函数调用括号后面
    func testFuncation(testBlock: () -> Void) {
        // 传递的是无参，无返回值的闭包
        testBlock()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    deinit{
        print("释放了")
    }
}





