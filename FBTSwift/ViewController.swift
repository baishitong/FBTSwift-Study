//
//  ViewController.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/24.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let dataArray: [String] = ["1：基本的语法调用",
                               "2：tableView简单用法",
                               "3：调用系统视频播放器",
                               "4：scrollView"]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "冯柏通的Swift3.0的学习"
        setupTableView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let text = dataArray[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("你点击了第\(indexPath.row)行!!!")
        switch indexPath.row {
        case 0:
            let dataVC = DataViewController()
            self.navigationController?.pushViewController(dataVC, animated: true)
        case 1:
            let tableVC = TableViewVC()
            self.navigationController?.pushViewController(tableVC, animated: true)
        case 2:
            let videoVC = VideoPlayVC()
            self.navigationController?.pushViewController(videoVC, animated: true)
        case 3:
            let scrollViewVC = ScrollViewVC()
            self.navigationController?.pushViewController(scrollViewVC, animated: true)
        default:
            print("暂无")
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// MARK: - 设置界面

extension ViewController {

    func setupTableView() {
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
    }
}

