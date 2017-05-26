//
//  RowHeightCell.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/26.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit

class RowHeightCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    internal var aspectConstraint: NSLayoutConstraint?{
    
        didSet {
         
            if oldValue != nil {
                imgView.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                imgView.addConstraint(aspectConstraint!)
            }
        }
    }
    var dataArr: [String]? {
    
        didSet {
        
            titleLabel.text = dataArr?[0] ?? ""
            loadImage((self.dataArr?[1])!)
        }
    }
    override func prepareForReuse() {
        
        super.prepareForReuse()
        //清除内容图片的宽高比约束
        aspectConstraint = nil
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension RowHeightCell {

    func loadImage (_ name: String) {
    
        if let image = UIImage(named: name) {
          let aspect = image.size.width / image.size.height
          aspectConstraint = NSLayoutConstraint(item: imgView, attribute: .width, relatedBy: .equal, toItem: imgView, attribute: .height, multiplier: aspect, constant: 20.0)
            imgView.image = image
        }else {
        
            //去除imageView里的图片和宽高比约束
            aspectConstraint = nil
            imgView.image = nil
        }
    }
}

