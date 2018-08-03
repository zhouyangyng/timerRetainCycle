//
//  NSTimer+BlcokTimer.m
//  test1
//
//  Created by zhouyang on 2018/8/3.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "NSTimer+BlcokTimer.h"

@implementation NSTimer (BlcokTimer)

+ (NSTimer *)bl_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repeats:(BOOL)repeats {
    
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(bl_blockSelector:) userInfo:[block copy] repeats:repeats];
}

+ (void)bl_blockSelector:(NSTimer *)timer {
    
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
