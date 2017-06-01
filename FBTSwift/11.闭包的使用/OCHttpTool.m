//
//  OCHttpTool.m
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/1.
//  Copyright © 2017年 fbt. All rights reserved.
//

#import "OCHttpTool.h"

@interface OCHttpTool ()

@property (nonatomic, copy) void(^CallBack)(NSString *name);


@end

@implementation OCHttpTool

- (void)loadData:(void (^)(NSString *))callback {

    self.CallBack = callback;//测试循环引用。
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"发送网络请求：%@", [NSThread currentThread]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"拿到数据，并且进行回调：%@",[NSThread currentThread]);
            callback(@"json数据");
            self.CallBack(@"到底循环引用了吗");//测试循环引用
        });
    });
    
}


@end
