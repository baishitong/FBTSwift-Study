//
//  TableViewVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/25.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class TableViewVC: BaseViewController {

    var fontNames = ["一点一点积累",
                     "我们慢慢开始",
                     "生活理应如此"]
    var fontRowIndex = 0
//    let tableView = UITableView()
    let suspendButton = UIButton(type: UIButtonType.custom)
    
//    lazy var tableView = UITableView()
    lazy var tableView: UITableView = {
        let fbtTableView = UITableView()
        return fbtTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TableView的明天会更好"
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isTranslucent = false
//        setupTableView()
        setupTableView()
        setupLazyTableView()
        setupSuspendButton()
        
         /*外层注释的开头/*这里是内层注释*/外层注释的结尾*/
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:- 执行的方法
extension TableViewVC{
    ///  创建表视图
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    /** 到底怎么回事*/
    func setupSuspendButton() {
    
    }
    func setupLazyTableView() {
    
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)

    }
}

// MARK:- tableView的数据源和代理方法
extension TableViewVC : UITableViewDelegate, UITableViewDataSource{

    
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
        //        let cell = UITableViewCell()
        //        cell.selectionStyle = .none
        //        cell.textLabel?.text = fontNames[indexPath.row]
        //        cell.textLabel?.textColor = UIColor.red
        //        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        //        return cell
        
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.selectionStyle = .none
        cell?.textLabel?.text = fontNames[indexPath.row]
        cell?.textLabel?.textColor = UIColor.red
        cell?.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        return cell!
    }

}


