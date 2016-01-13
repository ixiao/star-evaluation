//
//  RatingBar.h
//  fly
//
//  Created by lele on 15/5/4.
//  Copyright (c) 2015年 lele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingBar : UIView
@property (nonatomic,assign) NSInteger starNumber;
/*
 *调整底部视图的颜色
 */
@property (nonatomic,strong) UIColor *viewColor;

/*
 *是否允许可触摸
 */
@property (nonatomic,assign) BOOL enable;

@end
