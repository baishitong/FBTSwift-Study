//
//  SwiftBlockVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/27.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class SwiftBlockVC: BaseViewController {
    
    typealias AddBlock = (Int, Int) -> (Int)

    override func viewDidLoad() {
        super.viewDidLoad()
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

    // 闭包的定义
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
    


}
