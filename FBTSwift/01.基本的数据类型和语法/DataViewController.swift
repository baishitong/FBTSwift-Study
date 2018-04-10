//
//  DataViewController.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/24.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit
import Foundation

class DataViewController: BaseViewController {

//    在例子中，Ace被显式赋值为 1，并且剩下的原始值会按照顺序赋值。你也可以使用字符串或者浮点数作为枚举的原始值。使用rawValue属性来访问一个枚举成员的原始值。”
    
    enum Rank:Int {
        case Ace = 1
        case Two, Three, Four, Five, Six, Sever, Eight, Nine, Ten
        case Jack, Queen, King
        func simpleDescription() -> String {
            switch self {
            case .Ace:
                return "ace,这是枚举"
            case .Jack:
                return "jack 能走吗，不是break吗"
            case .Ten:
                return "难道返回的是Ten10"
            default:
                return String(self.rawValue)
            }
        }
    }
    
    //结构体
    struct Card {
        var rank:Rank
        func simpleDescription() -> String {
            return "The \(rank.simpleDescription()) of 服了这是毛线"
        }
    }
    
    // 申明User结构体
    struct User {
        
        var ID: Int
        var age: Int
    }
    
    // protocol 声明协议 类、枚举和结构体都可以实现协议。
    
//    protocol ExampleProtocol {
//        var oneDescription: String{ get }
//        mutating func addjust()
//    }
    
    
//    “你也可以创建泛型函数、方法、类、枚举和结构体。”
    enum OptionalValue<Wrapped> {
        case None
        case Some(Wrapped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "基本的语法调用附加单例的创建"
        
        view.backgroundColor = UIColor.white
        let explicitDouble:Double = 70
        print(explicitDouble)
        
        let label = "The width is"
        let width = 94
        let widthLabel = label + String(width)
        print(widthLabel)
        
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples"
        let fruitSummary = "I have \(apples + oranges) pieces of fruit"
        print(appleSummary,fruitSummary)
        
        var shoppingList = ["water","blue paint"]
        shoppingList[1] = "blue"
        print(shoppingList)
        
        var occupations = ["name":"FBT",
                           "sex" :"MAN"]
        occupations["year"] = "24"
        print(occupations)
        
        //如果类型信息可以被推断出来，你可以用[]和[:]来创建空数组和空字典——就像你声明变量或者给函数传参数的时候一样。
        let emptyArray = [String]()
        let emptyDictionary = [String:Float]()
        print(emptyArray,emptyDictionary)
        
        //MARK: 控制流
        
        let studentsScores = [75,43,103,87,12]
        var teamScore = 0
        for score in studentsScores {
            if score > 50 {
                teamScore += 3
            } else {
            
                teamScore += 1
            }
        }
        print(teamScore)
        //“你可以一起使用if和let来处理值缺失的情况。这些值可由"""可选值""""来代表。一个可选的值是一个具体的值或者是nil以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。”
        
        var optionalString:String? = "Hello"
        print(optionalString == nil,optionalString,"怎么回事")
        //“把optionalName改成nil，greeting会是什么  nil Hello! ”
//        “如果变量的可选值是nil，条件会判断为false，大括号中的代码会被跳过。如果不是nil，会将值解包并赋给let后面的常量，这样代码块中就可以使用这个值了。”
//        “另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。”
        
        var optionalName:String? = nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello,\(name)"
        }else{
        
            greeting = "He"
        }
        print(optionalName,greeting)
//        “另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。”  感觉相当于三目运算符
        
        let nickName: String? = nil
        let fullName: String = "Join Party"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        print(informalGreeting)
        
        //        “switch支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等“------注意let在上述例子的等式中是如何使用的，它将匹配等式的值赋给常量x。”
        
        let table = "red table"
        switch table {
        case "t":
            print("难道有t")
        case let x where x.hasSuffix("ble"):
            print("is it a spicy \(x)?")
        default:
            print("前面的都break了")
        }
        
//        “运行switch中匹配到的子句之后，程序会退出switch语句，并不会继续向下运行，所以不需要在每个子句结尾写break。”
        let numbers = [
        "Prime":[2,3,4,7,11,13],
        "Fibonacci":[1,1,2,3,5,8],
        "Square":[1,4,9,16,25],
        ]
        var largest = 0
        for (kind,nums) in numbers {
            for num in nums {
                if num > largest {
                    largest = num
                }
            }
            print(kind,"这是啥");
        }
        print(largest)
//        “使用while来重复运行一段代码直到不满足条件。循环条件也可以在结尾，保证能至少循环一次。”
        var n = 2
        while n < 100 {
            n = n * 2
        }
        print(n)
        
        var m = 2
        repeat {
        
            m = m * 2
        } while m < 100
        print(m)
        
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print(total)
        
        // MARK: 我们来调用函数
       print(greet(person: "FBT", day: "Tuesday"))
       print(greet("FBT", on: "坑死了没反应过来"))
//        greet(<#T##person: String##String#>, on: String)
        // MARK: 这个是元组 谁知道什么玩意。
        let statistics = calculateStatistics(scores:[5,3,100,3,9])
        print(statistics,"我不理解女人。正如我不知道我自己有多丑")
        print(statistics.sum)
        print(statistics.2)
        
        print(sumOf(),"这是不是空")
        print(sumOf(numbers: 42,597,12),"她没有任何反应？我懵了")
        print(returnFifteen(),"返回的是整数？函数嵌套")
        
        var increment = makeIncrementer()
        print(increment(7),"函数返回值？没看懂")
        
        var numbersFour = [20,19,7,12]
        print(hasAnyMatches(list: numbersFour, condition: lessThanTen),"看懂了？")
        
        
        // MARK: 什么叫闭包 “函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包所建作用域中能得到的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离。”
        
//        let mappedNumbers = numbers.map({ number in 3 * number })
//        print(mappedNumbers)
//        
//        let shape = Shape()
        let shape = Shape(name: "为什么")
        shape.numberOfSides = 7
        let shapeDescription = shape.simpleDescription()
        print(shapeDescription,"类到底用var还是let？基类")
        
        let text  = NamedShape(sideLength: 5.2, name: "提示的有点慢啊")
        print(text.area())
        print(text.simpleDescription())
        
        let property = PropertyShape(sideLength: 3.1, name: "get set")
        print(property.perimeter)
        property.perimeter = 9.9
        print(property.sideLength)
        
       // MARK: 现在是枚举  来玩一玩
        let ace = Rank.Ace
        let aceRawValue = ace.rawValue
        print(ace,aceRawValue,"真无语")
        
//        “使用init?(rawValue:)初始化构造器在原始值和枚举值之间进行转换。”
        if let convertedRank = Rank(rawValue:3) {
            let threeDescription = convertedRank.simpleDescription()
            print(threeDescription,"这个枚举的啥子啊，怎么转换的")
        }
        
        // MARK: 结构体？
        let threeOfSpades = Card(rank: .Three)
        print(threeOfSpades,"一知半解")
        var user = User(ID: 660303, age: 20)
        print("ID = \(user.ID) age = \(user.age)")
        let userPointer = withUnsafePointer(to: &user, {$0})
        // 1.打印user指针的值
        print(userPointer.pointee)
        // 3.获取user age的指针
        let agePointer = userPointer.advanced(by: 1)
        print(agePointer);
        
        // MARK: 协议初看
//        let a = SimpleClass()
//        a.addjust()
//        let aDescription = a.oneDescription
//        print(a.addjust(),aDescription,"打印协议的毛线")
//        
        
        // MARK: 泛型
        print(repeatItem(repeating: "knock", numberOfTimes: 4))
//        “ 重新实现 Swift 标准库中的可选类型”
        var possibleInteger:OptionalValue<Int> = .None
        possibleInteger = .Some(100)
        print(possibleInteger)
        
        // MARK: 单例
        let manage =  ShareManager.instance
        let manage1 = ShareManager.instance
        let manage2 = ShareManager.instance
        let manage3 = ShareManager.instance
        print("manage:\(manage) manage1:\(manage1) manage2:\(manage2) manage3:\(manage3)")
        
        // 错误处理 一个do语句创建了一个新的包含作用域,使得错误能被传播到一个或多个catch从句。
        do {
            try canThrowAnError()
            //没有错误消息抛出
        } catch  {
            //有一个错误消息抛出
        }
//        如果断言或者先决条件中的布尔条件评估的结果为 true（真），则代码像往常一样继续执行。如果布尔条件评估结果为false（假），程序的当前状态是无效的，则代码执行结束，应用程序中止。断言帮助你在开发阶段找到错误和不正确的假设，先决条件帮助你在生产环境中探测到存在的问题。
//        在这个例子中，只有 age >= 0 为 true 时，即 age 的值非负的时候，代码才会继续执行。如果 age 的值是负数，就像代码中那样，age >= 0 为 false，断言被触发，终止应用。
        let hhAge = -3
        
//        assert(hhAge >= 0, "a peison") //触发了断言 崩溃了项目
        
        if hhAge > 10 {
            print("大于10")
        } else if hhAge > 0 {
            print("大于0")
        } else {
//            assertionFailure("断言失败 ，一个人的年龄不能小于0")//触发了断言 崩溃了项目
        }
        
        let sex = 0 //0是男 1是女
        // case穿透
        switch sex {
        case 0:
            print("男")
            fallthrough
        case 1:
            fallthrough
            print("女")
        case 2:
            print("你向下传递几次")
        default:
            print("你是人妖")
        }
        switch sex {
        case 0, 1:
            print("男和女")
        default:
            print("你是人妖")
        }
        
        //switch 浮点型
        let a = 3.14
        switch a {
        case 3.14:
            print("打印浮点型")
        default:
            print("oo")
        }
        
        //switch 字符串
        let mFBT = 20
        let nFBT = 30
        var resultFBT :Int 
        
        let operation = "+"
        switch operation {
        case "+":
            resultFBT = mFBT + nFBT
            print(resultFBT)
        case "-":
            resultFBT = mFBT - nFBT
            print(resultFBT)
        default:
            print("字符错误")
        }
        
        // MARK: Switch 判断区间
        let score = 88
        switch score {
        case 0..<60:
            print("不及格")
        case 60..<80:
            print("及格")
        case 80...100:
            print("优秀")
        default:
            print("这个可以有")
        }
        // MARK: for 区间
        for i in 0..<10 {
            print(i)
        }
        for i in 0...10 {
            print(i,"到10")
        }
        
//        for _ in 0...9 {
//            print("你没有用到标识符")
//        }
        
        
        for _ in 0...9 {
        
            print("你没有用到标识符")
        }
        let age = 45
        online(age: age)
    }
    
    
    func online(age:Int) {
        
        guard age >= 18 else {
            print("回家找妈妈")
            return
        }
        guard age <= 40 else {
            print("年轻人事业")
            return
        }
        guard age >= 70 else {
            print("懵了")
            return
        }
        print("可以完")
        
    }
    
    
//    “使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值的类型。”
    
    func greet(person:String, day:String) -> String {
        return "Hello \(person),today is \(day)"
    }
    
//    “默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。”
    func greet(_ person :String, on day:String) -> String {
        return "Hello \(person), today is \(day)"
    }
//    “使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。 Int 和int 不一样”
    func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        for score in scores {
            if score > max {
                max = score
            }else if score < min {
                min = score
            }
            sum += score
        }
        return (min,max,sum)
    }
   
//    “函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：参数数量不定的函数，”
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    //  函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
    func returnFifteen() -> Int {
        var y = 10
        func add() {
        
            y += 5
        }
        add()
        return y
    }
    
//    “函数是第一等类型，这意味着函数可以作为另一个函数的返回值。”
    func makeIncrementer() -> ((Int)->Int) {
        func addOne(number:Int) -> Int {
        
            return 1 + number
        }
        return addOne
    }
    
//    “函数也可以当做参数传入另一个函数。”
    func hasAnyMatches(list:[Int],condition:(Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
//    Swift中参数默认是常量，在函数中是不能修改外部传入参数的值得，如果有需求，需要将参数声明成inout类型，示例如下：
    
    
    
    
//    //迷惘
//    class SimpleClass: ExampleProtocol {
//        var oneDescription:String = "A very simple class."
//        var another:Int = 69011
//        func addjust(){
//            oneDescription += "我can't"
//        }
//    }
    
    // MARK: 泛型 “在尖括号里写一个名字来创建一个泛型函数或者类型。Item 和item不一样“你也可以创建泛型函数、方法、类、枚举和结构体。”
    
    func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numberOfTimes {
            result.append(item)
        }
        return result
    }
    
//    一个函数可以通过在声明中添加throws关键词来抛出错误消息。当你的函数能抛出错误消息时, 你应该在表达式中前置try关键词。
    func canThrowAnError() throws {
        // 函数抛出错误
        print("错了的心")
    }
    
    
//    “在类型名后面使用where来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类。”
    
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
