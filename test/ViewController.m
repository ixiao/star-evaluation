//
//  ViewController.m
//  test
//
//  Created by IOS Developer on 16/1/5.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "ViewController.h"
#import "RatingBar.h"
@interface ViewController ()

{
    RatingBar * starView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    starView = [[RatingBar alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];//实例化 给坐标
    starView.backgroundColor = [UIColor clearColor];//背景颜色
    starView.enable = YES;//是否可以点击
    [self.view addSubview:starView];
    
}

@end
