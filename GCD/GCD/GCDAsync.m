//
//  GCDAsync.m
//  GCD
//
//  Created by 梁宪松 on 2017/8/9.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "GCDAsync.h"

@implementation GCDAsync

- (instancetype)init
{
    dispatch_queue_t s_queue_t = dispatch_queue_create("com.madao.serial.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t c_queue_t = dispatch_queue_create("com.madao.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    // 主线程依次执行
    dispatch_sync(s_queue_t, ^{
        NSLog(@"主线程依次执行");
    });
    // 一个子线程依次执行
    dispatch_async(s_queue_t, ^{
        NSLog(@"一个子线程依次执行1");
        
    });
    // 主线程依次执行
    dispatch_sync(c_queue_t, ^{
        NSLog(@"主线程依次执行");
    });
    // 多个子线程无序执行
    dispatch_async(c_queue_t, ^{
        NSLog(@"多个子线程无序执行1");
    });
    
    return nil;
}
@end
