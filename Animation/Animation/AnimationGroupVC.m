//
//  AnimationGroupVC.m
//  Animation
//
//  Created by WJ on 2017/8/25.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "AnimationGroupVC.h"

@interface AnimationGroupVC ()

@end

@implementation AnimationGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 绘出贝塞尔曲线
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(80, 300)];
    [bezierPath addCurveToPoint:CGPointMake(360, 300) controlPoint1:CGPointMake(150, 500) controlPoint2:CGPointMake(290, 100)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.view.bounds;
    shapeLayer.lineWidth = 5.0;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    // 创建添加动画的实体
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 40, 40);
    layer.position = CGPointMake(80, 300);
//    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"ship"].CGImage);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    [shapeLayer addSublayer:layer];
    
    // 旋转动画
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.path = bezierPath.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    
    // 改变背景颜色
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    
    // 将上面两个动画添加到动画组
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1, animation2];
    groupAnimation.duration = 3.0;
    
    // 动画完成后停止到终点
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
    
    [layer addAnimation:groupAnimation forKey:nil];
    
    [bezierPath closePath];
    
}



@end
