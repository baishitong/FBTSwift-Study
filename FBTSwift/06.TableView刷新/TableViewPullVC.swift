//
//  TableViewPullVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/26.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class TableViewPullVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    //存数组
    var dataArray = [String]()
    //表格底部用来提示数据加载的视图
    var loadMoreView: UIView?
    var activityIndicator: UIActivityIndicatorView?
    //计数器（用来做延时模拟网络加载效果）
    var timer: Timer!
    //用了记录当前是否允许加载新数据（正则加载的时候会将其设为false，放置重复加载）
    var loadMoreEnable = true
    // 下拉刷新控件
    var refreshControl: UIRefreshControl?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "TableView上拉加载,下拉刷新"
        refreshControl?.beginRefreshing()
        setupScrollingView()
        setupTableView()
        loadMoreData()
        addRefreshControl()
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = self.dataArray[indexPath.row]
        // 当下拉到底部,执行加载数据
        if loadMoreEnable && indexPath.row == self.dataArray.count - 1{
            
            loadMoreData()
        }
        return cell

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TableViewPullVC {

    func setupTableView() {
    
        tableView = UITableView (frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        self.automaticallyAdjustsScrollViewInsets = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = loadMoreView
        view.addSubview(tableView)
    }
    
    func setupScrollingView() {
    
        loadMoreView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        loadMoreView?.autoresizingMask = .flexibleWidth
        loadMoreView?.backgroundColor = UIColor.orange
        // 中间加载进度条
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator?.color = UIColor.darkGray
        let x = (self.loadMoreView?.frame.size.width)! / 2 - (activityIndicator?.frame.size.width)! / 2
        let y = (self.loadMoreView?.frame.size.height)! / 2 - (activityIndicator?.frame.size.height)! / 2
        activityIndicator?.frame = CGRect(x: x, y: y, width: (activityIndicator?.frame.size.width)!, height: (activityIndicator?.frame.size.height)!)
        //添加
        loadMoreView?.addSubview(activityIndicator!)
        
    }
    
    func addRefreshControl() {
    
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        tableView.addSubview(refreshControl!)
    }
    
   @objc func refreshData() {
    
        // 移除老数据
        //        dataArray.removeAll()
        //随机添加5条新数据（时间是当前时间）
        for i in 0 ..< 5 {
            dataArray.insert("新闻标题\(i)", at: 0)
        }
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
}

extension TableViewPullVC {

    func loadMoreData() {
    
        activityIndicator?.startAnimating()
        loadMoreEnable = false
    //   timer = Timer(timeInterval: 1.0, target: self, selector: #selector(TableViewPullDemo.timeOut), userInfo: nil, repeats: true)
        // 注意: 定义定时器,上面方法不能触发,一定要下面的方法!!!
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timeOut), userInfo: nil, repeats: true)
        
    }
    
    @objc func timeOut() {
    
        setupScrollingView()
        let start = self.dataArray.count + 1
        //MARK: 没看懂
        for i in start ..< start + 20 {
            self.dataArray.append("转移注意力，工作提升技能\(i)")
        }
        tableView.reloadData()
        loadMoreView?.removeFromSuperview()
        loadMoreView = nil
        activityIndicator?.stopAnimating()
        loadMoreEnable = true
    }
    func loadData() {
    
        dataArray = ["今年，成就技术大牛","专注，成就技术大牛","勿念，成就技术大牛","总结，成就技术大牛","多学，成就技术大牛"]
    }
}
