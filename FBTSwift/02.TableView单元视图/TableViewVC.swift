//
//  TableViewVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/25.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class TableViewVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var fontNames = ["一点一点积累",
                     "我们慢慢开始",
                     "生活理应如此"]
    var fontRowIndex = 0
    let tableView = UITableView()
    let suspendButton = UIButton(type: UIButtonType.custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TableView的明天会更好"
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isTranslucent = false
        setupTableView()
        setupSuspendButton()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("你点击了第\(indexPath.row)行!!!")
    }
    
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = fontNames[indexPath.row]
        cell.textLabel?.textColor = UIColor.red
        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension TableViewVC{
    
    // MARK:创建表视图
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    
    func setupSuspendButton() {
    
//        suspendButton.frame = CGRect(x: , y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
    
}
