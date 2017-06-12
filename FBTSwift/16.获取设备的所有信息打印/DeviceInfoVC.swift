//
//  DeviceInfoVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/2.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class DeviceInfoVC: BaseViewController {

    @IBOutlet weak var showLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "获取设备的所有的信息打印"
        getInfo()

        // Do any additional setup after loading the view.
    }

    func getInfo() {
    
        //应用程序信息
        let infoDictionary = Bundle.main.infoDictionary!
        let appDisplayName = infoDictionary["CFBundleDisplayName"]//程序名称
        let majorVersion = infoDictionary["CFBundleShortVersionString"]//主程序版本号
        let minorVersion = infoDictionary["CFBundleVersion"]//版本号 (内部标示)
        let appVersion = majorVersion as! String
        
        // 设备信息
        let iosVersion = UIDevice.current.systemVersion //IOS版本
        let identifierNumber = UIDevice.current.identifierForVendor //设备Uuid
        let systemName = UIDevice.current.systemName //系统名称
        let model = UIDevice.current.model //设备型号
        let localizedModel = UIDevice.current.localizedModel//设备区域化型号如A1533
        let name = UIDevice.current.name //名称

        showLabel.text = "程序名称：\(appDisplayName)\n主程序版本号：\(appVersion)\n内部版本号：\(minorVersion)\niOS版本：\(iosVersion)\n设备udid：\(identifierNumber)\n系统名称：\(systemName)\n设备型号：\(model)\n设备区域化型号：\(localizedModel)\n不知道这个是啥名称：\(name)"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
