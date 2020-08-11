//
//  protocolVC.swift
//  FBTSwift
//
//  Created by 冯柏通 on 2020/4/7.
//  Copyright © 2020 fbt. All rights reserved.
//

import UIKit

class protocolVC: BaseViewController {
   
    struct Person: Named,Aged {
           var name:String
           var age:Int
    }
    
    struct Stack<Element> {
        var items = [Element]()
        mutating func push(_ item: Element) {
            items.append(item)
        }
        mutating func pop() ->Element {
            return items.removeLast()
        }
    }
    
//    
//    struct IntStack:Container {
//        var count: Int
//        
//        subscript(i: Int) -> Int {
//            <#code#>
//        }
//        
//        typealias ItemType = Int
//        
//        var items = [Int]()
//        mutating func append(_ item: Int) {
//            items.append(item)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let p = Person(name:"fasfda",age:20)
        
        wish(to: p)
    }
    
    func wish(to:Named & Aged) {
        print("name \(to.name) age\(to.age)")
    }
    
    func swapTwoValue<T>(_ a: inout T,_ b: inout T) {
        let tempA = a
        a = b
        b = tempA
    }


}

protocol Named {
    var name:String {get}
}

protocol Aged {
    var age:Int {get}
}

protocol TextAble {
    var desc:String {get}
}

//extension protocolVC {
//    extension Person:TextAble {
//        var desc:String {
//            return "name\(name) age\(age)"
//        }
//    }
//}

protocol Container {
    associatedtype ItemType
    mutating func append (_ item: ItemType)
    var count: Int{get}
    subscript(i:Int) -> ItemType {get}
}
