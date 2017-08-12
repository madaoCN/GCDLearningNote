//
//  main.m
//  NSOperation
//
//  Created by 梁宪松 on 2017/8/9.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InvocationOpClass.h"
#import "CustomOperation.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        queue.maxConcurrentOperationCount = 5;
        CustomOperation *op = [[CustomOperation alloc] initWithStr:@"test"];
        CustomOperation *op2 = [[CustomOperation alloc] initWithStr:@"test2"];
        [op addDependency:op2];
        
        [queue addOperation:op];
        [queue addOperation:op2];
        [queue cancelAllOperations];
        NSLog(@"Hello, World!");
    }
    return 0;
}
