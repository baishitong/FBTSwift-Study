//
//  DeleagteOneVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/26.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class DeleagteOneVC: BaseViewController, DelegateTwoVCDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "代理的使用"

        
    }
    @IBAction func click(_ sender: Any) {
        let pushVC = DelegateTwoVC()
        pushVC.delegate = self
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func didInputText(_ string: String) {
        label.text = string
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
