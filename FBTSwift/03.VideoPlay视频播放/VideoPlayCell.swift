//
//  VideoPlayCell.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/25.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit
// 定义闭包就是block, 传递播放按钮的事件 <无参数，无返回值>
typealias videoPlayButtonClick = () -> ()

class VideoPlayCell: UITableViewCell {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    var model: VideoPlayModel? {
    
        didSet{
            titleLabel.text = model?.title
            backgroundImageView.image = UIImage(named: (model?.image)!)
            sourceLabel.text = model?.source
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func playButtonClick(_ sender: Any) {
        if playBlock != nil {
            playBlock!()
        }
    }
    
//    var playBlock = videoPlayButtonClick.self???
    var playBlock: videoPlayButtonClick?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
