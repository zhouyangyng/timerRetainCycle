//
//  SecondView.m
//  timerRetainCycle
//
//  Created by zhouyang on 2018/8/3.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "SecondView.h"
#import "ZYWeakObject.h"

@interface SecondView ()

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) UILabel *label;

@property (assign, nonatomic) NSInteger num;

@end


@implementation SecondView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    [self addSubview:self.label];
    self.backgroundColor = [UIColor lightGrayColor];
    
    // 设置timer，使用weakProxy
    ZYWeakObject *weakObj = [ZYWeakObject proxyWithWeakObject:self];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakObj selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction {
    
    self.num += 2;
    self.label.text = [NSString stringWithFormat:@"我是view2: %ld", self.num];
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        _label.bounds = CGRectMake(0, 0, 130, 30);
        _label.textColor = [UIColor blueColor];
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
