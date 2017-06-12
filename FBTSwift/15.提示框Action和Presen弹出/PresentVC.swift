//
//  PresentVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/2.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class PresentVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "提示框Action和Present控制器"
        view.backgroundColor = UIColor.yellow

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let BVC = BViewController()
        self.navigationController?.present(BVC, animated: true, completion: nil)
        
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
