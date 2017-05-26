//
//  TableViewRowHeightVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/26.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class TableViewRowHeightVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView: UITableView = UITableView()
    var dataArray = [[String]]()
    let cellId = "rowHeightCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "tableView的单元格高度自适应"

        loadData()
        setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RowHeightCell
        cell.selectionStyle = .none
        cell.dataArr = self.dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("你点击了第\(indexPath.row)行!!!")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: 初始化数据
extension TableViewRowHeightVC {

    func loadData() {
    
        dataArray.append(["第一节：Swift 环境搭建", "img1.jpg"])
        dataArray.append(["第二节：Swift 基本语法（类型定义、循环遍历、判断、继承）", "img2.jpg"])
        dataArray.append(["第三节：Swift 数据类型", "img3.jpg"])
    }
}
// 设置界面
extension TableViewRowHeightVC {

    func setupTableView() {
    
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        view.addSubview(tableView)
        // <设置下面两条属性高度自适应,iOS8才能使用>
        //设置estimatedRowHeight属性默认值
        tableView.estimatedRowHeight = 200
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        // 注册cell
        tableView.register(UINib.init(nibName: "RowHeightCell", bundle: nil), forCellReuseIdentifier: cellId)

    }
}


