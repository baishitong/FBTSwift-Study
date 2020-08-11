//
//  MoreOtherVC.swift
//  FBTSwift
//
//  Created by 冯柏通 on 2020/4/15.
//  Copyright © 2020 fbt. All rights reserved.
//

import UIKit

class MoreOtherVC: BaseViewController {

    
    enum MachineError:Error {
        case invalidSelection
        case insufficientFunds(coinsNeeded:Int)
        case outOfStock
    }
    struct Item {
        var price:Int
        var count:Int
    }
    class Machine {
        var tory = ["Candy":Item(price: 6, count: 8),
                    "Chips":Item(price: 10, count: 9),
                    "Bread":Item(price: 15, count: 5)]
        var coins = 0
        func vend(ItemName: String) throws {
            
            defer {
                print("退出")
            }
            print("开始卖")
            guard let item = tory[ItemName] else {
                throw MachineError.invalidSelection
            }
            guard item.count > 0 else {
                throw MachineError.outOfStock
            }
            guard coins >= item.price else {
                throw MachineError.insufficientFunds(coinsNeeded: item.price - coins)
            }
            
            
            coins -= item.price
            var newItem = item
            newItem.count -= 1
            tory[ItemName] = newItem
            print("卖出")
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var machine = Machine()
        machine.coins = 5
        
        do {
            try machine.vend(ItemName: "Chips")
        } catch MachineError.invalidSelection {
            print("no")
        } catch {
            print("hha")
        }
    }


}
