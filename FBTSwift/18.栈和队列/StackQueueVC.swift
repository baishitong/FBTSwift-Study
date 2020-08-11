//
//  StackQueueVC.swift
//  FBTSwift
//
//  Created by 冯柏通 on 2020/3/26.
//  Copyright © 2020 fbt. All rights reserved.
//

import UIKit

class StackQueueVC: BaseViewController {

    
    var x:String = "hello"
    
    struct Stack<T> {
        private var elements = [T]()
        
        var count : Int {
            return elements.count
        }

        var isEmpty:Bool {
            return elements.isEmpty
        }
        
        mutating func push (_ element: T) {
            elements.append(element)
        }
        
        mutating func pop() -> T? {
            return elements.popLast()//返回可选择值结果，如果数组值为空，返回的为nil。
        }
    
    }
    
    struct Queue<T> {
        private var elements = [T]()
        
        var count : Int {
            return elements.count
        }
        
        var isEmpty:Bool {
            return elements.isEmpty
        }
        
        mutating func enqueue(_ element:T) {
            elements.append(element)
        }
        mutating func dequeue() -> T? {
            return isEmpty ? nil : elements.removeFirst()
        }
        
    }
    
    
    struct Person {
        var naem: String
        var age: Int
    }
    
//
//    extension Person: Hashable {
//        func hash(into hasher: inout Hasher) {
//            hasher.combine(age)
//            hasher.combine(name)
//        }
//    }
    
    enum Barcode {
        case upc(Int,Int,Int,Int)
        case qrCode(String)
    }




    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var stackkk = Stack<Int>()
        stackkk.push(1)
        stackkk.push(6)
        stackkk.push(8)
        stackkk.push(10)
        print(stackkk.count);
        print(stackkk.pop() ?? 0)
        print(stackkk.count)
        
        var queue = Queue<Int>()
        queue.enqueue(25)
        queue.enqueue(12)
        queue.enqueue(1)
        print(queue.count)
        print(queue.dequeue() ?? 0)
        print(queue.count)
        
//        set---集合
        var letters = Set<Character>()
        letters.insert("c")
        print(letters)
        
        var course: Set<String>  = ["Math","English","History"]
        course.insert("History")
        print(course)
//        Type 'StackQueueVC.Person' does not conform to protocol 'Hashable'
//        let persons: Set<Person> = [Person(naem: "zhangsan", age: 20)]
//        print(persons)

        let set: Set<Character> = ["A","B","C"]
        let set2: Set<Character>  = ["B","E","F","G"];
        print(set.intersection(set2)) //交集
        print(set.union(set2))//两个集合在一起
        print(set.symmetricDifference(set2))//两个集合减去两个集合的交集
        print(set.subtracting(set2))//相对补集。set剔除两个集合的交集，
        
        
//        var dict1 = Dictionary<String, Int>()
//        var dict2 = [String: Int]()
//        var dict3: Dictionary<String, Int> = [:]
        var dict = ["a":18,"b":24]
        for (key,valur) in dict {
            print("name \(key),age\(valur)")
        }
        print(dict.merging(["a":2,"c":5], uniquingKeysWith: { (current, _) -> Int in
            current
        }))
        
        print(dict.merging(["a":10,"d":11], uniquingKeysWith: { (_, new) -> Int in
            new
        }))
        dict.merging(["a":2,"c":5], uniquingKeysWith: { (current, _) -> Int in
            current
        })
        print(dict)
        dict.merging(["a":10,"d":11], uniquingKeysWith: { (_, new) -> Int in
            new
        })
        print(dict)
        
        let kvs:KeyValuePairs = ["a":1,"b":2,"c":3];
        print(kvs)
        

        
        let names = ["D","A","C","B"]
//        var revers = names.sorted { (s1: String, s2: String) -> Bool in
//            return s1 > s2
//        }
//        var revers = names.sorted { s1, s2 in return s1 > s2}
//        var revers = names.sorted { s1, s2 in s1 > s2}

//        var revers = names.sorted(by: { $0 > $1})
//        var revers = names.sorted(by: >)
        
        let revers = names.sorted{$0 > $1}
        print(revers)
        
        
        //闭包的捕获值。
        
        let increBytem = makeInAdd(amount: 10)
        print(increBytem())
        print(increBytem())

        print(increBytem())

        let IncreBySeve = makeInAdd(amount: 7)
        print(IncreBySeve())
        
        let anotherIncreByTem = increBytem
        
        print(anotherIncreByTem())
        
        
        var fbt = ["f","b","t"]
        print(fbt.count)
        let customfbt = { fbt.remove(at: 0)}
        print(fbt.count)
        print(customfbt())
        print(fbt.count)
        //自动闭包
        serve(custem:{fbt.remove(at: 0)})
        serveAuto(custem: fbt.remove(at: 0))
        
        
        var fbtnames = ["zhangsan","lisi","wangwu","zhaoliu"]
//        let customerProvider = {fbtnames.remove(at: 0)}
//        print(fbtnames.count)
//        print(customerProvider())
//        print(fbtnames.count)
        
        collectProviders(provider: fbtnames.remove(at: 0))
//        collectProviders(provider: {fbtnames.remove(at: 0)})
        print(fbtnames.count)
        for provider in providers {
            print(provider)
        }
        print(fbtnames.count)
        //必须使用self
        collectProviders(provider: self.x)
        
        let gaoNumbers = [1,2,3,4,5]
        print(gaoNumbers.map {$0 * 10} )
        print(gaoNumbers.filter {$0 > 4})
        print(gaoNumbers.reduce(100) {$0  + $1})
        
        let dames:[String?] = ["zzzz","lll",nil,"wwww",nil,"mmmm"]
        print(dames.count)
        
        print(dames.compactMap{ $0 })
        print(dames.compactMap{ $0?.count })
        
        
        
        var produceCode = Barcode.upc(1, 2, 3, 4)
        print(produceCode)
        

       
    }
    
    func makeInAdd(amount: Int) -> () -> Int {
        var total = 0
        func increadd() -> Int {
            total += amount
            return total
        }
        return increadd
    }
    
    func serve(custem customerProvider:() -> String) {
        print(customerProvider())
    }
    func serveAuto(custem customerProvider:@autoclosure() -> String) {
        print(customerProvider())
    }
    //逃逸闭包
    var providers:[() ->String] = []

    func collectProviders(provider: @autoclosure @escaping () ->String) {
        providers.append(provider)
    }
//    var completionHandlers:[() -> Void] = []
//    func someFunctionWithEscapingClosure(completionHandler: @escaping ()) -> Void {
//        completionHandlers.append {
//            completionHandler
//        }
//    }
    //自动闭包

}


