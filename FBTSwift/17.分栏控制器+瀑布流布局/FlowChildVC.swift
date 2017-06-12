//
//  FlowChildVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/12.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 8
private let kFlowCellID = "kFlowCellID"

class FlowChildVC: BaseViewController {

    // MARK: 对外属性
    var homeType : HomeTypeTitle!
    fileprivate lazy var collectionView : UICollectionView = {
    
        let layout = WaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: kEdgeMargin, left: kEdgeMargin, bottom: kEdgeMargin, right: kEdgeMargin)
        layout.minimumLineSpacing = kEdgeMargin
        layout.minimumInteritemSpacing = kEdgeMargin
        layout.dataSource = self
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.randomColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kFlowCellID)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return collectionView

        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()
        setupUI()
    }
}

// MARK:- 设置UI界面内容
extension FlowChildVC {
    fileprivate func setupUI() {
            view.addSubview(collectionView)
    }
}

// MARK:- collectionView的数据源&代理
extension FlowChildVC : UICollectionViewDataSource, WaterfallLayoutDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kFlowCellID, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    func waterfallLayout(_ layout: WaterfallLayout, indexPath: IndexPath) -> CGFloat {
        return indexPath.item % 2 == 0 ? kScreenW * 2 / 3 : kScreenW * 0.5
    }
    
}

