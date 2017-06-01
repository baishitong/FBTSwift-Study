//
//  OCHttpTool.h
//  FBTSwift
//
//  Created by fengbaitong on 2017/6/1.
//  Copyright © 2017年 fbt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCHttpTool : NSObject
- (void)loadData:(void (^)(NSString *))callback;
@end
