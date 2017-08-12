//
//  InvocationOpClass.m
//  NSOperation
//
//  Created by 梁宪松 on 2017/8/9.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "InvocationOpClass.h"

@implementation InvocationOpClass

- (NSOperation *)taskWithStr:(NSString *)str
{
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(foo:) object:nil];
    return op;
}


- (void)foo:(id)data
{
    NSLog(@"===%@", data);
}

@end
