//
//  ProvidedDataViewController.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/28.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class ProvidedDataViewController: BaseViewController {
   /// 懒加载
    lazy var array : [String] = {
        () ->[String] in
        return["why", "imj", "inj"]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "补充01基本的数据类型"
        strFunc()
        ArrayFunc()
        dicFunc()
        rowFunc()
        optionalFunc()
        print("输出懒加载\(array)")
        
        
        
        
        print(sum(num1: 20, num2: 30))
//        注意一：
//        内部参数：在函数内部可以看到的参数就是内部参数，默认情况下所有的参数都是内部参数
//        外部参数：在函数外部看到的参数名称就是外部函数，默认情况从第二个参数开始既是内部函数也是外部函数。  如果希望第一个参数是外部参数，可以在表示符钱给参数添加一个别名。
//        sum(num1: <#T##Int#>, num2: <#T##Int#>)
         // 注意三：可变参数
        print(makeCoffee(coffeeName: "拿铁"))
        print(makeCoffee(coffeeName: "卡布奇诺"))
        print(makeCoffee())
        
        print(sum(num: 18, 20, 30, 50))
        //    注意四：指针类型
        var m = 20
        var n = 30
        swapNum(m: &m, n: &n)
        print("m:\(m), n\(n)")
        //    注意五：函数的嵌套使用（了解）
        text()
        
        let p = Person()
        print(p)
        
        let one = PersonOne()
//        one.averageScore
        PersonOne.courseCount = 2
        let two = PersonOne(name : "why", age : 18)
        print(two.name)
        
        let three = PersonOne(dict: ["name" : "why" as AnyObject, "height" : 1.88 as AnyObject, "age" : 18 as AnyObject]
        )
        print(three.age)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ProvidedDataViewController {

    func strFunc() {
    
        let str :String = "高级字符串的使用"
        let str2 = "可以省略，推导"
        for c in str2 {
            print(c)
        }
        let str3 = str + str2
        print(str3)
        
        let age = 19
        let name = "FBt"
        let info = "my name is \(name), my year is \(age)"
        print(info)
        
        let min = 2
        let second = 8
        let timeStr = String(format: "%02d:%02d", arguments: [min,second])
        print(timeStr)
        
        let urlString = "www.520it.com"
        let header = (urlString as NSString).substring(to: 3)
        
        let middle = (urlString as NSString).substring(with: NSMakeRange(4, 5))
        let footer = (urlString as NSString).substring(from: 10)
        
        print(header)
        print(middle)
        print(footer)
    }
    
    func ArrayFunc() {
    
        let a = 10
        let array =  ["FBT","FBT"]
        let array2 = [a,a]
        var arrayM = [String]()
        print(array2)
        arrayM.append("浪费时光等于浪费生命")
        arrayM.append("数组里必须放相同元素")
        arrayM.append("否则会报错")
        arrayM.append("必须统一")
        arrayM.append("删除第五个")
        arrayM.append("删除第6个")
        print(arrayM)
        arrayM.remove(at: 4)
        arrayM.removeLast()
        arrayM.removeFirst()
        print(arrayM)
        let strArray = arrayM[2]
        print(strArray)
        arrayM[2] = "被改变"
        
        for i in 0..<arrayM.count {
            print(arrayM[i])
        }
        
        for name in arrayM {
            print(name)
        }
        
        for name in arrayM[0..<2] {
            print(name)
        }
        let resultArray = arrayM + array
        print(resultArray)
    }
    
    func dicFunc() {
    
        let dic = ["Fbtt" : "不开心","没有感觉真正爱的人" : "情商太低，不满足"]
//        这里视频上说用AnyObject 和NSObject。但是需要在后面加 as AnyObject as NSObject 但是用Any就没事,3.0后的
        var dictM = [String : Any]()
        dictM["name"] = "FBT"
        dictM["age"] = 24
        dictM["sex"] = "男"
        dictM["weight"] = 120
        print(dic,dictM)
        dictM.removeValue(forKey: "weight")
        dictM["age"] = 25
        dictM["haveGirl"] = false
        print(dictM)
        for key in dictM.keys {
            print(key)
//            print(dictM[key] ?? AnyObject.self)
        }
        for value in dictM.values {
            print(value)
        }
        for (key,value) in dictM {
            print(key,value)
        }
        for (key, value) in dic {
        
            dictM[key] = value
        }
    }
    
    func  rowFunc() {
    
        let info = ("why", 18, 1.88)
        print(info.0)
        
        let info1 = (name : "FBT", age : "24", sex : "男")
        print(info1.name)
        print(info1.2)
        let(name, age, height) = ("TWN", 18, 1.88)
        print(name)
        print(age)
        print(height)
    }
    
    func optionalFunc() {
    
        var name :Optional<String> = nil
        
        name = "ddd"
        name = "www"
        if let name = name {
            print(name)
        }
        
        
        var name2 : String? = nil
        
        
        name2 = "爽死-----"
        print(name2.unsafelyUnwrapped);
        print(name2!)
        
        let url = NSURL(string: "http://520it.com")//string返回值为可选类型,如果加了汉字就有可能创建失败。所以。url是不安全的。"http://520it.com\\到底"
        let request = NSURLRequest(url: url! as URL)
        
    }
    
    func sum(num1 : Int, num2 : Int) -> Int {
        return num1 + num2
    }
    
    //注意二：swift中的默认参数
    func makeCoffee(coffeeName : String = "雀巢") -> String {
        return "制作了一杯\(coffeeName)咖啡"
    }
    
    // 注意三：可变参数
    func sum(num: Int...) -> Int {
        var result = 0
        for n in num {
//            result = result + n
            result += n
        }
        return result
    }
//    注意四：指针类型

    func swapNum( m : inout Int, n : inout Int) {
        let temp = m
        m = n
        n = temp
    }
//    注意五：函数的嵌套使用（了解）
    func text() {
    
        func demo() {
            print("demo")
        }
        
        print("test")
        demo()
    }
   
}

class Person {
    var age : Int = 0
}



