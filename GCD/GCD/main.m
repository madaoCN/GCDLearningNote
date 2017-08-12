//
//  main.m
//  GCD
//
//  Created by 梁宪松 on 2017/8/9.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(timer, ^{
            
            //do something
        });
        dispatch_resume(timer);
        NSLog(@"Hello, World!");

    }
    return 0;
}
