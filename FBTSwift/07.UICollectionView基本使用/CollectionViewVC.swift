//
//  CollectionViewVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/26.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class CollectionViewVC: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView?
    let collectionCellID: String = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UICollectionView基本使用"
        setupCollectionView()
        registerCell()

    }

    // UICollectionView DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath)
        cell.backgroundColor = UIColor.green
        return cell
    }
    // UICollectionView Delegate
    // item的Size
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (SCREEN_WIDTH - 30)/2, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你点击了第\(indexPath.section)的第\(indexPath.item)个Iten")

    }
    // UICollectionViewDelegateFlowLayout
    // Item的上左下右的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

extension CollectionViewVC {

    func setupCollectionView() {
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (SCREEN_WIDTH-30)/2, height: (SCREEN_HEIGHT-30)/2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView!)
    }
    
    func registerCell() {
    
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
    }
    
}
