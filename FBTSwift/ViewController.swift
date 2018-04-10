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
                               "4：scrollView",
                               "5：tableView系统的自适应高度",
                               "6：tableView刷新",
                               "7：collectionView的基本使用",
                               "8：代理传值",
                               "9：SnapKit的使用",
                               "10：Swift修饰和3.0",
                               "11：闭包的使用",
                               "12：补充01基本的数据类型",
                               "13：Swift协议深入学习",
                               "14：CoreGraphicsFramework学习",
                               "15：提示框Action和Present控制器",
                               "16：获取设备的所有信息打印",
                               "17：分栏控制器+瀑布流布局"]
    
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
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) //这样写会崩溃
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
        case 4:
            let tableHeight = TableViewRowHeightVC()
            self.navigationController?.pushViewController(tableHeight, animated: true)
        case 5:
            let tableRefresh = TableViewPullVC()
              self.navigationController?.pushViewController(tableRefresh, animated: true)
        case 6:
            let collectionVC = CollectionViewVC()
            self.navigationController?.pushViewController(collectionVC, animated: true)
        case 7:
            let DelegateVC = DeleagteOneVC()
            self.navigationController?.pushViewController(DelegateVC, animated: true)
        case 8:
            let snapKitVC = SnapKitVC()
            self.navigationController?.pushViewController(snapKitVC, animated: true)
        case 9:
            let newPointVC = NewPointAndModifierVC()
            self.navigationController?.pushViewController(newPointVC, animated: true)
        case 10:
            let swiftBlockVC = SwiftBlockVC()
            self.navigationController?.pushViewController(swiftBlockVC, animated: true)
        case 11:
            let proVidedDataVC = ProvidedDataViewController()
            self.navigationController?.pushViewController(proVidedDataVC, animated: true)
        case 12:
            let protocolVC = ProtocolAllVC()
            self.navigationController?.pushViewController(protocolVC, animated: true)
        case 13:
            let coreGraphicsVC = CoreGraphicsVC()
            self.navigationController?.pushViewController(coreGraphicsVC, animated: true)
        case 14:
            let presentVC = PresentVC()
            self.navigationController?.pushViewController(presentVC, animated: true)
        case 15:
            let deviceInfoVC = DeviceInfoVC()
            self.navigationController?.pushViewController(deviceInfoVC, animated: true)
        case 16:
            let fallFlowVC = WaterfallFlowCollectVC()
            self.navigationController?.pushViewController(fallFlowVC, animated: true)
        default:
            print("暂无")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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

