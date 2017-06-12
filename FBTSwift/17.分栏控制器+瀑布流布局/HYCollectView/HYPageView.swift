//
//  HYPageView.swift
//  HYContentPageView
//
//  Created by xiaomage on 2016/10/27.
//  Copyright © 2016年 seemygo. All rights reserved.
//

import UIKit

class HYPageView: UIView {
    
    // MARK: 定义属性
    fileprivate var titles : [String]!
    fileprivate var style : HYTitleStyle!
    fileprivate var childVcs : [UIViewController]!
    fileprivate weak var parentVc : UIViewController!
    
    fileprivate var titleView : HYTitleView!// 先用？ 对象类型可选类型。，然后在addsubview的时候还得强制解包。因为 上面确定赋值了。所以不会有危险。
    fileprivate var contentView : HYContentView!//写叹号默认帮你解包。
    
    // MARK: 自定义构造函数
    init(frame: CGRect, titles : [String], style : HYTitleStyle, childVcs : [UIViewController], parentVc : UIViewController) {
        super.init(frame: frame)
        
        assert(titles.count == childVcs.count, "标题&控制器个数不同,请检测!!!")
        self.style = style
        self.titles = titles
        self.childVcs = childVcs
        self.parentVc = parentVc
        parentVc.automaticallyAdjustsScrollViewInsets = false
        
        setupUI()
    }
    //如果不实现这个方法就会报错
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK:- 设置界面内容 设置titleview和contentView
extension HYPageView {
    fileprivate func setupUI() {
        let titleH : CGFloat = style.titleHeight
        let titleFrame = CGRect(x: 0, y: 0, width: frame.width, height: titleH)
        titleView = HYTitleView(frame: titleFrame, titles: titles, style : style)
        titleView.delegate = self
        addSubview(titleView)
        
        let contentFrame = CGRect(x: 0, y: titleH, width: frame.width, height: frame.height - titleH)
        contentView = HYContentView(frame: contentFrame, childVcs: childVcs, parentViewController: parentVc)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.delegate = self
        addSubview(contentView)
    }
}


// MARK:- 设置HYContentView的代理
extension HYPageView : HYContentViewDelegate {
    func contentView(_ contentView: HYContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        titleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    func contentViewEndScroll(_ contentView: HYContentView) {
        titleView.contentViewDidEndScroll()
    }
}


// MARK:- 设置HYTitleView的代理
extension HYPageView : HYTitleViewDelegate {
    func titleView(_ titleView: HYTitleView, selectedIndex index: Int) {
        contentView.setCurrentIndex(index)
    }
}
