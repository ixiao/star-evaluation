//
//  RatingBar.m
//  fly
//
//  Created by lele on 15/5/4.
//  Copyright (c) 2015年 lele. All rights reserved.
//

#import "RatingBar.h"


#define ZOOM 0.8f
@interface RatingBar()
//底部view
@property (nonatomic,strong) UIView *bottomView;
//顶部view
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,assign) CGFloat starWidth;
@end

@implementation RatingBar


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        
        //设置view的底部视图大小和view一样大 完全重合
        self.bottomView = [[UIView alloc] initWithFrame:self.bounds];
        //设置view的的顶部视图为0 位置大小全为零
        self.topView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.bottomView];
        [self addSubview:self.topView];
        
        
        
        // 子视图超过主视图的高度或宽度就会被裁减 也就说topview超过view的大小就会被剪裁
        self.topView.clipsToBounds = YES;
        
        
        
        //view可以响应事件
        self.userInteractionEnabled = YES;
        //创建轻击手势识别器
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        //创建拖拽手势识别器
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        //添加轻击手势识别器
        [self addGestureRecognizer:tap];
        //添加拖拽手势识别器
        [self addGestureRecognizer:pan];
        
        //设置星星宽度是view宽度的七分之一
        CGFloat width = frame.size.width/7.0;
        self.starWidth = width;
        for(int i = 0;i<5;i++){
            //定义imageview
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width*ZOOM, width*ZOOM)];
            //确定图片位置
            img.center = CGPointMake((i+1.5)*width, frame.size.height/2);
            //把透明的星星图片加到imageview上
            img.image = [UIImage imageNamed:@"bt_star_a"];
            //把该imageview加到底部视图上
            [self.bottomView addSubview:img];
            //定义imageview
            UIImageView *img2 = [[UIImageView alloc] initWithFrame:img.frame];
            //确定图片位置
            img2.center = img.center;
            //把黄色的星星图片加到imageview上
            img2.image = [UIImage imageNamed:@"bt_star_b"];
            
       
            
            //把该imageview加到顶部视图上
            [self.topView addSubview:img2];
        }
        //是否允许可触摸 这是自定义属性
        self.enable = YES;
        
    }
    
    
    
    return self;
}
//上面是通过构造方法创建了一个底部带空白星星 顶部带黄色星星的view 初始化时顶部视图的大小为零 即黄色星星不会显示


//设置背景颜色
-(void)setViewColor:(UIColor *)backgroundColor{
    if(_viewColor!=backgroundColor){
        //设置view的颜色
        self.backgroundColor = backgroundColor;
        
        self.topView.backgroundColor = backgroundColor;
        self.bottomView.backgroundColor = backgroundColor;
    }
}
//设置星星数量
-(void)setStarNumber:(NSInteger)starNumber{
    if(_starNumber!=starNumber){
        _starNumber = starNumber;
        //通过控制顶部view的大小来控制黄色星星的数量
        self.topView.frame = CGRectMake(0, 0, self.starWidth*(starNumber+1), self.bounds.size.height);
    }
}
//轻击事件会触发的方法
-(void)tap:(UITapGestureRecognizer *)gesture{
    
    if(self.enable){
        //point获取的手指点击的位置坐标
        CGPoint point = [gesture locationInView:self];
        
        NSInteger count = (int)(point.x/self.starWidth)+1;
        self.topView.frame = CGRectMake(0, 0, self.starWidth*count, self.bounds.size.height);
        
        if(count>5){
            _starNumber = 5;
        }else{
            _starNumber = count-1;
        }
    }
}
//拖拽手势触发的方法
-(void)pan:(UIPanGestureRecognizer *)gesture{
    if(self.enable){
        //获取拖拽的偏移量
        CGPoint point = [gesture locationInView:self];
        
        NSInteger count = (int)(point.x/self.starWidth);
        if(count>=0 && count<=5 && _starNumber!=count){
            self.topView.frame = CGRectMake(0, 0, self.starWidth*(count+1), self.bounds.size.height);
            _starNumber = count;
        }
    }
}



@end
