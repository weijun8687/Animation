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
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(80, 300)];
    
    [bezierPath addCurveToPoint:CGPointMake(360, 300) controlPoint1:CGPointMake(150, 500) controlPoint2:CGPointMake(290, 100)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.view.bounds;
    shapeLayer.lineWidth = 5.0;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.path = bezierPath.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
    
    
}



@end
