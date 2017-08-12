//
//  ProcSource.m
//  GCD
//
//  Created by 梁宪松 on 2017/8/12.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "CommonHeaders.h"

dispatch_source_t MonitorProcess()
{
    // 获取进程pid
    pid_t pid = getppid();
    // 获取全局队列，优先级默认
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 创建source
     dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_PROC , pid, DISPATCH_PROC_EXIT, queue);
    if (source)
    {
        dispatch_source_set_event_handler(source, ^{
            // do something with process exit event
            dispatch_source_cancel(source);
//            dispatch_release(source);
        });
        dispatch_resume(source);
    }
    
    return source;
}
