//
//  VideoPlayVC.swift
//  FBTSwift
//
//  Created by fengbaitong on 2017/5/25.
//  Copyright © 2017年 fbt. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var dataArray:[VideoPlayModel] = []
    let cellId = "VideoPlayID"
    let tableView = UITableView()
    //创建播放器
    var playVC = AVPlayerViewController()
    var playView = AVPlayer()
    let playerViderButton = UIButton(type: UIButtonType.custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "系统视频播放器"
        loadData()
        setupTableView()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! VideoPlayCell
        cell.selectionStyle = .none
        cell.model = dataArray[indexPath.row]
        
        cell.playBlock = {
        
            let path = Bundle.main.path(forResource: "movie", ofType: "mp4")
            self.playView = AVPlayer(url: URL(fileURLWithPath: path!))
            self.playVC.player = self.playView
            self.present(self.playVC, animated: true, completion: { 
                self.playVC.player?.play()
            })
        }
        return cell
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension VideoPlayVC {

    func loadData() {
    
        let imgArray = ["videoScreenshot01","videoScreenshot02","videoScreenshot03","videoScreenshot04","videoScreenshot05","videoScreenshot06"]
        let titleArray = ["Introduce 3DS Mario","Emoji Among Us","Seals Documentary","Adventure Time","Facebook HQ","Lijiang Lugu Lake"]
        let resourceArray = ["Youtube - 06:32","Vimeo - 3:34","Vine - 00:06","Youtube - 02:39","Facebook - 10:20","Allen - 20:30"]
        
        for i in 0..<6 {
            let videoModel = VideoPlayModel()
            videoModel.image = imgArray[i]
            videoModel.title = titleArray[i]
            videoModel.source = resourceArray[i]
            dataArray.append(videoModel)
        }
        tableView.reloadData()
    }
    
    func setupTableView() {
    
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.register(UINib.init(nibName: "VideoPlayCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
}
