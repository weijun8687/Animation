//
//  StopAnimation.m
//  Animation
//
//  Created by WJ on 2017/8/30.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "StopAnimation.h"

@interface StopAnimation ()<CAAnimationDelegate>

@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) UIButton *btnStart;
@property (nonatomic, strong) UIButton *btnEnd;

@end

@implementation StopAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnStart.frame = CGRectMake(50, 120, 40, 20);
    [self.btnStart setTitle:@"开始" forState:UIControlStateNormal];
    [self.btnStart setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:self.btnStart];
    [self.btnStart addTarget:self action:@selector(clickStartButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnEnd = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnEnd.frame = CGRectMake(120, 120, 40, 20);
    [self.btnEnd setTitle:@"结束" forState:UIControlStateNormal];
    [self.btnEnd setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:self.btnEnd];
    [self.btnEnd addTarget:self action:@selector(clickEndButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.layer = [CALayer layer];
    self.layer.frame = CGRectMake(50, 50, 40, 40);
    self.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"ship"].CGImage);
    [self.view.layer addSublayer:self.layer];
}

// 点击开始按钮
- (void)clickStartButton:(UIButton *)button{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 3.0;
    animation.byValue = @(M_PI * 2);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    // 自动回放
    animation.autoreverses = YES;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:@"rotateAnimation"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"transform.scale";
    animation2.duration = 3.0;
    animation2.toValue = @2.0;
    animation2.removedOnCompletion = NO;
    animation2.fillMode = kCAFillModeForwards;
    animation2.delegate = self;
    [self.layer addAnimation:animation2 forKey:@"scale"];
}

// 点击结束按钮
- (void)clickEndButton:(UIButton *)button{
    
    // 移除指定的动画
    [self.layer removeAnimationForKey:@"rotateAnimation"];
    // 移除所有的动画
//    [self.layer removeAllAnimations];
    
    // 动画移除后 保持在当前位置
    self.layer.transform = self.layer.presentationLayer.transform;
}

#pragma mark Animation delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSString *strAnimation = nil;
    if ([self.layer animationForKey:@"rotateAnimation"] == anim) {
        strAnimation = @"rotateAnimation";
    }
    if ([self.layer animationForKey:@"scale"] == anim){
        strAnimation = @"scaleAnimation";
    }
    NSLog(@"%@ stop finish: %@",strAnimation, flag? @"yes": @"no");
}


@end
