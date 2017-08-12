//
//  heritOperation.m
//  NSOperation
//
//  Created by 梁宪松 on 2017/8/9.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "CustomOperation.h"

@implementation CustomOperation
{
    id _data;
}

- (instancetype)initWithStr:(NSString *)str
{
    if (self = [super init]) {
        
        _data = str;
        executing = NO;
        finished = NO;
    }
    return self;
}

- (void)dealloc
{
}

- (BOOL)isConcurrent
{
    return YES;
}

- (void)start
{
    if ([self isCancelled]) {
        
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
    }
    
    //如果没有cancel
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main
{
    @try {
        
        @autoreleasepool {
            // insert code here...
//            while (![self isCancelled]) {
//                NSLog(@"%@", [NSString stringWithFormat:@"==%@", _data]);
//            }
            NSLog(@"%@", [NSString stringWithFormat:@"==%@", _data]);
            [self completeOperation];
            
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)completeOperation {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    executing = NO;
    finished = YES;
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

@end
