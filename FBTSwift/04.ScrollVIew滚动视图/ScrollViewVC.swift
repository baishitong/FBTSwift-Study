//
//  ScrollViewVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/25.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class ScrollViewVC: BaseViewController {
    
    // 创建scrollView
    var scrollView = UIScrollView()
    
    // 创建View
    var subViewOne: ScrollViewSubOneView?
    var subViewTwo: ScrollViewSubTwoView?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "scrollView"
        setupScrollView()
        layoutScrollView()
        setSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ScrollViewVC {

    func setupScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = UIColor.purple
        
        view.addSubview(scrollView)
    }
    
    func layoutScrollView() {
        scrollView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * 2, height: SCREEN_HEIGHT)
    }
    
}

extension ScrollViewVC {

    func setSubViews() {
       //故意超出屏幕范围
        subViewOne = ScrollViewSubOneView(frame: CGRect(x: 0.0, y: 64.0, width: SCREEN_WIDTH, height: 100), text: "我要学习，充实自己，一步一步，必须这样")
        subViewTwo = ScrollViewSubTwoView(frame: CGRect(x: 1 * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        scrollView.addSubview(subViewOne!)
        scrollView.addSubview(subViewTwo!)
        subViewTwo?.rowActionBlock = {
            (tableView,indexPath,dataArray) -> Void in
            
            //弹出视图
            let alertVC = UIAlertController(title: "FBT,你要定更高的目标", message: "目标高了，你需要行动，还有激励", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel , handler: { (cancel) in
                print("取消")
            })
            let okAction = UIAlertAction(title: "OK", style: .destructive, handler: { (ok) in
                print("ok!")
            })
            alertVC.addAction(cancelAction)
            alertVC.addAction(okAction)
            self.present(alertVC, animated: true, completion: { 
                 print("控制器弹出来了啦!!!")
            })
            
        }
        
    }
}
