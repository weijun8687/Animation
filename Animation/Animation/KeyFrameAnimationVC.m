//
//  KeyFrameAnimationVC.m
//  Animation
//
//  Created by WJ on 2017/8/25.
//  Copyright © 2017年 WJ. All rights reserved.
//  让头像沿着 画出的贝塞尔曲线滑动

#import "KeyFrameAnimationVC.h"

@interface KeyFrameAnimationVC ()

@end

@implementation KeyFrameAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self moveWithBezierpath];
    
    [self transform];
    
}

// 让图像视图旋转
- (void)transform{
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(50, 300, 200, 200);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.view.layer addSublayer:shipLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 3.0;
    // 相对值
    animation.byValue = @(M_PI * 2);
    // 绝对值
//    animation.toValue = @(M_PI * 2);
    animation.repeatCount = INT_MAX;
    [shipLayer addAnimation:animation forKey:nil];
}

// 让图像沿着贝塞尔曲线移动
- (void)moveWithBezierpath{
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(80, 200)];
    
    /**
     画三次贝塞尔曲线
     
     @param CurveToPoint 结束点坐标
     @param controlPoint1 第一个点的坐标
     @param controlPoint2 第二个点的坐标
     */
    [bezierPath addCurveToPoint:CGPointMake(290, 200) controlPoint1:CGPointMake(150, 300) controlPoint2:CGPointMake(220, 100)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.view.bounds;
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor blueColor].CGColor;
    pathLayer.lineWidth = 5.0;
    [self.view.layer addSublayer:pathLayer];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 40, 40);
    shipLayer.position = CGPointMake(80, 200);
    shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"ship"].CGImage);
    [self.view.layer addSublayer:shipLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.path = bezierPath.CGPath;
    // 让图层 根据 曲线的切线 自动旋转
    animation.rotationMode = kCAAnimationRotateAuto;
    // 设置 动画完成后 是否动画回到原点
    //    [animation setAutoreverses:YES];
    
    // 下面两句达到的效果: 动画完成后 停在终点
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [shipLayer addAnimation:animation forKey:nil];
    
    [bezierPath closePath];

}

@end
