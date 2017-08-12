//
//  VNodeSource.m
//  GCD
//
//  Created by 梁宪松 on 2017/8/12.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "CommonHeaders.h"

dispatch_source_t MonitorFileNameChange(const char* filename)
{
    // 文件只读
    int fd = open(filename, O_EVTONLY);
    if (fd == -1) return NULL;//获取失败
    // 获取全局队列，优先级默认
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 创建source
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_VNODE, fd, DISPATCH_VNODE_RENAME, queue);
    
    if (source)
    {
        // 获取文件名长度
        int length = strlen(filename);
        char* newString = (char*)malloc(length + 1);
        newString = strcpy(newString, filename);
        dispatch_set_context(source, newString);
        // 设置事件响应
        dispatch_source_set_event_handler(source, ^{
            
            const char* oldFilename = (char*)dispatch_get_context(source);
            // dosomething
        });
        // 清理操作
        dispatch_source_set_cancel_handler(source, ^{
            char* fileStr = (char*)dispatch_get_context(source);
            free(fileStr);
            close(fd);
        });
        // 恢复source
        dispatch_resume(source);
    }
    return nil;
}

