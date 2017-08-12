//
//  ReadSource.m
//  GCD
//
//  Created by 梁宪松 on 2017/8/10.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "CommonHeaders.h"

dispatch_source_t ReadContentsFromFile(const char* filename)
{
    // 获取文件指针
    int fd = open(filename, O_RDONLY);
    if (fd == -1) {//获取失败
        return NULL;
    }
    // 设置文件描述符状态旗标,防止阻塞读取操作
    fcntl(fd, F_SETFL, O_NONBLOCK);
    // 获取全局队列，优先级默认
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 创建source
    dispatch_source_t readSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_READ, fd, 0, queue);
    if (!readSource) {
        close(fd);
        return NULL;
    }
    // 设置事件响应
    dispatch_source_set_event_handler(readSource, ^{
        
        size_t estimatedSize = dispatch_source_get_data(readSource) + 1;
        char *buffer = (char *)malloc(estimatedSize);
        if (buffer) {
            ssize_t actual = read(fd, buffer, (estimatedSize));
            // do something with buffer
            free(buffer);
            
            //读取完毕后
            dispatch_source_cancel(readSource);
        }
    });
    // 取消事件
    dispatch_source_set_cancel_handler(readSource, ^{close(fd);});
    // 唤醒source
    dispatch_resume(readSource);
    return readSource;
}
