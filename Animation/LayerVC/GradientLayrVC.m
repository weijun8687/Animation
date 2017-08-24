//
//  GradientLayrVC.m
//  Animation
//
//  Created by WJ on 2017/8/23.
//  Copyright © 2017年 WJ. All rights reserved.
//  绘制颜色渐变图层

#import "GradientLayrVC.h"

@interface GradientLayrVC ()

@end

@implementation GradientLayrVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self changeColor];
    [self changeColors];
    
}

// 多重渐变
- (void)changeColors{
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(100, 300, 100, 100);
    [self.view.layer addSublayer:layer];
    
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor greenColor].CGColor];
    layer.locations = @[@0, @0.25, @0.5];
    
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    
    
}

// 颜色的渐变  对角 两个颜色
- (void)changeColor{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(100, 120, 100, 100);
    [self.view.layer addSublayer:gradientLayer];
    
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 0.5);

}


@end
