//
//  SnapKitVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/26.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitVC: BaseViewController {

    lazy var box = UIView()
    lazy var backView = UIView()
    lazy var innerBox = UIView()
    lazy var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SnapKit的使用"
        demo1()
        demo2()
//        demo3()
//        demo4()
        demo5()
        demo6()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SnapKitVC {

    func demo1() {
    
        box.backgroundColor = UIColor.orange
        view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalTo(self.view)
        }
    }
    
    // 2.greaterThanOrEqualTo属性:backView.left 大于等于 box.left：
    func demo2() {
    
        backView.backgroundColor = UIColor.green
        view.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.left.greaterThanOrEqualTo(box).offset(20)
            make.top.equalTo(box)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    // 3.left、right、top、centerX、centerY等其他属性
    func demo3() {
    
        innerBox.backgroundColor = UIColor.red
        view.addSubview(innerBox)
        innerBox.snp.makeConstraints { (make) in
            make.right.equalTo(box)
            make.bottom.equalTo(box)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    // 4.内位移修正：inset
    func demo4() {
        innerBox.backgroundColor = UIColor.red
        view.addSubview(innerBox)
        innerBox.snp.makeConstraints { (make) in
             make.edges.equalTo(box).inset(UIEdgeInsetsMake(10, 10, 10, 10))
        }
    
    }
    
    // 5.倍率修正：multipliedBy
    func demo5() {
    
        innerBox.backgroundColor = UIColor.red
        view.addSubview(innerBox)
        innerBox.snp.makeConstraints { (make) in
            make.center.equalTo(box)
            make.size.equalTo(box).multipliedBy(0.5)
        }
    }
    
    func demo6() {
    
        label.backgroundColor = UIColor.purple
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.left.equalTo(10)
//            make.width.equalTo(200)
//            make.height.equalTo(20)
            make.right.equalTo(-10)
        }
        label.text = "我要的那个人你在哪里要等多久？我要的那个人你在哪里要等多久？我要的那个人你在哪里要等多久？我要的那个人你在哪里要等多久？我要的那个人你在哪里要等多久？我要的那个人你在哪里要等多久？";
        label.numberOfLines = 0
    }
    
}
