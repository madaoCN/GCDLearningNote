//
//  CommonHeaders.h
//  GCD
//
//  Created by 梁宪松 on 2017/8/10.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#ifndef CommonHeaders_h
#define CommonHeaders_h
#import <Foundation/Foundation.h>


/**
 创建timer source

 @param interval 触发间隔
 @param leeway   定时器精度
 @param queue    执行队列
 @param block    定时器操作block

 @return dispatch_source_t
 */
dispatch_source_t CreateDispatchTimer(uint64_t interval, uint64_t leeway,
                                      dispatch_queue_t queue, dispatch_block_t block);


/**
 创建 DISPATCH_SOURCE_TYPE_READ 读取文件

 @param filename 文件名

 @return dispatch_source_t
 */
dispatch_source_t ReadContentsFromFile(const char* filename);

/**
 创建 DISPATCH_SOURCE_TYPE_WRITE 写文件

 @param filename 文件名

 @return dispatch_source_t
 */
dispatch_source_t WriteDataToFile(const char* filename);

/**
 创建 DISPATCH_SOURCE_TYPE_VNODE 监听文件系统名称改变

 @param filename 文件名

 @return dispatch_source_t
 */
dispatch_source_t MonitorFileNameChange(const char* filename);

/**
 创建 DISPATCH_SOURCE_TYPE_PROC 监听进程

 @return dispatch_source_t
 */
dispatch_source_t MonitorProcess();

#endif /* CommonHeaders_h */
