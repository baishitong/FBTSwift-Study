//
//  ThreadVC.swift
//  FBTSwift
//
//  Created by 冯柏通 on 2020/4/9.
//  Copyright © 2020 fbt. All rights reserved.
//

import UIKit

class ThreadVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<10 {
            if #available(iOS 10.0, *) {
                Thread.detachNewThread {
                    print(i)
                }
            } else {
                threadTest()
            }
        }
        threadTest()
        test()
        
        //并行队列。
        let queue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
        queue.sync {
            print("in queue sync")
        }
        queue.async {
            sleep(1)
            print("in queue aaaaasync")
        }
        print("hhhhh")
        
        
        queue.asyncAfter(deadline: .now() + 1) {
            print("in after")
        }
        
//        dispatch source 是一个监视某些类型事件的对象。当这些事件发生时，它自动将一个task放入到一个dispatch queue的执行历程中
        
        let group = DispatchGroup()
        group.enter()
        queue.async {
            sleep(1)
            print("A请求完成")
            group.leave()
        }
        group.enter()
        queue.async {
            sleep(1)
            print("B请求完成")
            group.leave()
        }
        print("调用完成")
//
//        group.wait()
//        print(("A和B完成，合并数据"))
        
        group.notify(queue: queue) {
            print("A和B notify 完成")
        }
        print("notify")
        
        
        var seconds = 10
        let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
        timer.schedule(deadline: .now(), repeating: 1.0)
        timer.setEventHandler {
            seconds -= 1
            if seconds < 0 {
                timer.cancel()
            } else {
                print(seconds)
            }
        }
        timer.resume()
        
        let lockQueue = DispatchQueue(label: "label")//串行队列。线程queue在串行队列执行task1的时候，在队列中投递了task2.同时要求必须阻塞当前线程，来等待task2完成。
        //task1没有完成，串行队列不会去执行task2.且我们在当前线程等待task2的结束才能执行task1.1和2互相等待，死锁。
        lockQueue.async {
            print("in queue async task1")
            lockQueue.sync {
                print("in queue sync task2")
            }
        }
        
        
        
        
    }
    
    
    func threadTest() {
        let thread = Thread(target: self, selector: #selector(threadWorker), object: nil)
        thread.start()
    }
    
    @objc func threadWorker() {
        print("threadWorker")
    }
    
    func test() {
        let operation = BlockOperation{ [weak self] in
            self?.threadWorker()
        }
        
        operation.completionBlock = { ()-> Void in
            print("z这是回调")
        }
        let  queue = OperationQueue()
        queue.addOperation(operation)
        
    }


}
