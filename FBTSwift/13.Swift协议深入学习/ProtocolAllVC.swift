//
//  ProtocolAllVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/31.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit




protocol Student {
    // 1.具体来说只能使用var关键字声明并且必须明确规定该属性是可读的get、还是可读可写的get set，另外还可以通过关键字static声明一个类型属性.
    //定义一个可读可写的 name 属性
    var name: String { get set }
    var birthPlace: String { get }
    static var qualification: String { get }
    //2.协议中定义方法
    static func study()
    //实例方法
    func changeName()
}

//3.不同协议，相同协议方法
protocol TextOne {
    func text() -> Int
}
protocol TextTwo {
    func text() -> Int
}

struct Puple: Student {
    
    var name: String
    //变量名称必须和协议属性相同！
    static var qualification: String = "小学"
    var birthPlace: String = "北京"
    
    static func study() {
        print("类方法实现")
    }
    
    func changeName() {
        print("实例方法实现")
    }
    // 异变方法: 在结构体中的方法修改到属性的时候需要在方法前面加上关键字mutating表示该属性能够被修改
}

struct Perple: TextOne, TextTwo {
    
    func text() -> Int {
        return 10
    }
    func text() -> String {
        return "hello"
    }
}




class ProtocolAllVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Swift协议深入学习"
        let p1 = Puple(name: "小明", birthPlace: "上课")
        print(p1)
        //协议中的只读属性修饰的是协议这种“类型”的实例
        Puple.qualification = "中学"
        print(Puple.qualification)
        Puple.study()
        p1.changeName()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
