//
//  ScrollViewSubOneView.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/25.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class ScrollViewSubOneView: UIView {

    var label = UILabel()
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        label.frame = CGRect(x: 100, y: 300, width: SCREEN_WIDTH, height: 50)
        label.text = text
        label.textAlignment = .center
        self.addSubview(label)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("为什么必须写")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.center = self.center
    }
    
}
