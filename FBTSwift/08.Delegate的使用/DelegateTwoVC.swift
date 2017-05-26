//
//  DelegateTwoVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/26.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

//定义协议
protocol DelegateTwoVCDelegate {

    func didInputText(_ string: String)
}

class DelegateTwoVC: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    // 定义代理
    var delegate: DelegateTwoVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    @IBAction func clickBtn(_ sender: Any) {
        if delegate != nil {
            delegate?.didInputText(textField.text!)
            self.navigationController?.popViewController(animated: true)
            
        }
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
