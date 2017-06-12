//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by 1 on 16/9/14.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
//创建swift的文件，改为导入uikit，扩展。

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    //可能创建对象也可能不创建
    convenience init?(hex : String, alpha : CGFloat = 1.0) {
    
        // 0xFF0000 
        //1.判断字符串的长度是否符合
        guard hex.characters.count >= 6 else {
            return nil
        }
        //2.将字符串转成大写
        var tempHex = hex.uppercased()
        //3.判断开头：0x/#/##
        if tempHex.hasPrefix("0x") || tempHex.hasPrefix("##") {
            tempHex = (tempHex as NSString).substring(from: 2)
        }
        if tempHex.hasPrefix("#") {
            tempHex = (tempHex as NSString).substring(from: 1)
        }
        //4.分别取出RGB  
        //FF -> 255
        var range = NSRange(location: 0, length: 2)
        let rHex = (tempHex as NSString).substring(with: range)
        range.location = 2
        let gHex = (tempHex as NSString).substring(with: range)
        range.location = 4
        let bHex = (tempHex as NSString).substring(with: range)
        
        //5. 将十六进制转成数字，emoji表情  扫描器，scanner
        //创建扫描器
        var r : UInt32 = 0, g : UInt32 = 0, b : UInt32 = 0
        //hex是16进制，结果的指针。  rgb是可变的
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        self.init(r : CGFloat(r), g : CGFloat(g), b : CGFloat(b))
    }
    //没有参数直接用类方法。
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
