//
//  BlockOpClass.m
//  NSOperation
//
//  Created by 梁宪松 on 2017/8/9.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "BlockOpClass.h"

@implementation BlockOpClass


- (NSOperation *)taskWithBlock:(void (^)(void))block
{
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:block];
    return op;
}

@end
