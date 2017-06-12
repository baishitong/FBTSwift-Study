//
//  CViewController.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/2.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class CViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "C页面"

        
        
        view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 返回到上一个页面
//        self.dismiss(animated: true, completion: nil)

//        // 1.直接返回到根页面 连续dismiss两个页面
//        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
         // 2.循环调用 presentingViewController 获取根VC，再dissmiss
        var rootVC = self.presentingViewController
        while let parent = rootVC?.presentingViewController {
            rootVC = parent
        }
        rootVC?.dismiss(animated: true, completion: nil)
//        //3.直接获取根控制器,dismiss
//        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
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
