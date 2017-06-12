//
//  WaterfallFlowCollectVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/12.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class WaterfallFlowCollectVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK:- 设置UI界面
extension WaterfallFlowCollectVC {

    fileprivate func setupUI() {
        setupContentView()
    }
    
    fileprivate func setupContentView() {
        // 1.获取数据
        let homeTypes = loadTypesData()
        // 2.创建主题内容
        let style = HYTitleStyle()
        //如果有tabbar 在去减掉44
//        let pageFrame = CGRect(x: 0, y: kNavigationBarH + kStatusBarH, width: kScreenW, height: kScreenH - kNavigationBarH - kStatusBarH - 44)
        let pageFrame = CGRect(x: 0, y: kNavigationBarH + kStatusBarH, width: kScreenW, height: kScreenH - kNavigationBarH - kStatusBarH )
        let titles = homeTypes.map({ $0.title })
        var childVcs = [FlowChildVC]()
        for type in homeTypes {
            let VC = FlowChildVC()
            VC.homeType = type
            childVcs.append(VC)
        }
        let pageView = HYPageView(frame: pageFrame, titles: titles, style: style, childVcs: childVcs, parentVc: self)
        view.addSubview(pageView)
    }
    
    fileprivate func loadTypesData() -> [HomeTypeTitle] {
        //path语句后面那个！是强制解包。确定一定可以根据bundle拿到path。
        let path = Bundle.main.path(forResource: "types.plist", ofType: nil)!
        let dataArray = NSArray(contentsOfFile: path) as! [[String : Any]]
        var tempArray = [HomeTypeTitle]()
        for dict in dataArray {
            tempArray.append(HomeTypeTitle(dict: dict))
        }
        return tempArray
    }
    
}
