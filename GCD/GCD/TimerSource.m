//
//  TimerSource.m
//  GCD
//
//  Created by 梁宪松 on 2017/8/10.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "CommonHeaders.h"


dispatch_source_t CreateDispatchTimer(uint64_t interval, uint64_t leeway,
                                      dispatch_queue_t queue, dispatch_block_t block)
{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,         0, 0, queue);
    
    if (timer) {
        dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), interval, leeway);//设置定时器信息
        dispatch_source_set_event_handler(timer, block);//设置处理器
        dispatch_resume(timer); //调用以便函数开始处理事件
    }
    return timer;
}
