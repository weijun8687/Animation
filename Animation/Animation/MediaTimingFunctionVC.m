//
//  MediaTimingFunctionVC.m
//  Animation
//
//  Created by WJ on 2017/8/31.
//  Copyright © 2017年 WJ. All rights reserved.
//  动画缓冲函数

#import "MediaTimingFunctionVC.h"

@interface MediaTimingFunctionVC ()

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation MediaTimingFunctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake((self.view.bounds.size.width / 2.0), (self.view.bounds.size.height / 2.0));
    [self.view.layer addSublayer:self.colorLayer];
    self.colorLayer.backgroundColor = [UIColor purpleColor].CGColor;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 方式一
//    // 设置动画的缓冲效果
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    
//    self.colorLayer.position = [[touches anyObject] locationInView:self.view];
//    [CATransaction commit];
    
    // 方式二
    
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.colorLayer.position = [[touches anyObject] locationInView:self.view];

    } completion:^(BOOL finished) {
        
    }];
    
    
}



@end
