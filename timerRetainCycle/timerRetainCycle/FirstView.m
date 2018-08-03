//
//  FirstView.m
//  timerRetainCycle
//
//  Created by zhouyang on 2018/8/3.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "FirstView.h"
#import "NSTimer+BlcokTimer.h"

@interface FirstView ()

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) UILabel *label;

@property (assign, nonatomic) NSInteger num;

@end

@implementation FirstView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    [self addSubview:self.label];
    self.backgroundColor = [UIColor yellowColor];
    
    // 设置timer，使用block分类方法
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer bl_scheduledTimerWithTimeInterval:1 block:^{
        [weakSelf timerAction];
    } repeats:YES];
}

- (void)timerAction {
    
    self.num += 1;
    self.label.text = [NSString stringWithFormat:@"我是view1: %ld", self.num];
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        _label.bounds = CGRectMake(0, 0, 130, 30);
        _label.textColor = [UIColor redColor];
        _label.font = [UIFont systemFontOfSize:18];
    }
    return _label;
}

-(void)dealloc {
    NSLog(@"%s", __func__);
    [self.timer invalidate];
    self.timer = nil;
}

@end
