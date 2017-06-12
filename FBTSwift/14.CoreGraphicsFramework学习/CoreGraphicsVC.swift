//
//  CoreGraphicsVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/2.
//  Copyright © 2017年 fbt. All rights reserved.
//

// 线条的绘制
/*
 1，什么是Core Graphics
 （1）Core Graphics Framework 是一套基于 C 的 API 框架，使用了 Quartz 作为绘图引擎，可用于一切绘图操作。它提供了低级别、轻量级、高保真度的 2D 渲染。
 （2）Quartz 2D 是 Core Graphics Framework 的一部分，是一个强大的二维图像绘制引擎。
 （3）我们使用的 UIKit 库中所有 UI 组件其实都是由 CoreGraphics 绘制实现的。所以使用 Core Graphics 可以实现比 UIKit 更底层的功能。
 （4）当我们引入 UIKit 框架时系统会自动引入 Core Graphics 框架，同时在 UIKit 内部还对一些常用的绘图 API 进行了封装，方便我们使用。
 2，绘图的一般步骤
 （1）获取绘图上下文
 （2）创建并设置路径
 （3）将路径添加到上下文
 （4）设置上下文状态（如笔触颜色、宽度、填充色等等）
 （5）绘制路径

 http://www.hangge.com/blog/cache/detail_1437.html
 */



import UIKit

class CoreGraphicsVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CoreGraphicsFramework学习"
        // 1.绘制的直线
        let lineView = LineView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(lineView)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
