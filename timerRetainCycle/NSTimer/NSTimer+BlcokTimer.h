//
//  NSTimer+BlcokTimer.h
//  test1
//
//  Created by zhouyang on 2018/8/3.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (BlcokTimer)

+ (NSTimer *)bl_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)(void))block
                                        repeats:(BOOL)repeats;

@end
