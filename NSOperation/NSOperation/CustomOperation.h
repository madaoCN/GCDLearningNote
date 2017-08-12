//
//  heritOperation.h
//  NSOperation
//
//  Created by 梁宪松 on 2017/8/9.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomOperation : NSOperation
{
    BOOL executing;
    BOOL finished;
}

- (instancetype)initWithStr:(NSString *)str;

@end
