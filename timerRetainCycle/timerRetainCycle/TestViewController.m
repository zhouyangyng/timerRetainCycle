//
//  TestViewController.m
//  timerRetainCycle
//
//  Created by zhouyang on 2018/8/3.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "TestViewController.h"
#import "FirstView.h"
#import "SecondView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    FirstView *first = [[FirstView alloc] initWithFrame:CGRectMake(50, 100, 250, 160)];
    [self.view addSubview:first];
    
    SecondView *second = [[SecondView alloc] initWithFrame:CGRectMake(50, 300, 250, 160)];
    [self.view addSubview:second];
    
}



@end
