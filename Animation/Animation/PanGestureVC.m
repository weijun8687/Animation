//
//  PanGestureVC.m
//  Animation
//
//  Created by WJ on 2017/8/30.
//  Copyright © 2017年 WJ. All rights reserved.
//  手动动画

#import "PanGestureVC.h"

@interface PanGestureVC ()

@property (nonatomic, strong) CALayer *doorLayer;

@end

@implementation PanGestureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.doorLayer = [CALayer layer];
    self.doorLayer.frame = CGRectMake(50, 50, 100, 200);
    self.doorLayer.anchorPoint = CGPointMake(0, 0.5);
    self.doorLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"door.jpg"].CGImage);
    [self.view.layer addSublayer:self.doorLayer];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/ 500.0;
    self.view.layer.sublayerTransform = perspective;
    
    // 给整个屏幕添加滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    
    // 暂停图层的动画
    self.doorLayer.speed = 0;
    // 添加动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 1.0;
    [self.doorLayer addAnimation:animation forKey:nil];
    
}

-(void)pan:(UIPanGestureRecognizer *)gesture{
    CGFloat x = [gesture translationInView:self.view].x;
    x /= 200.0;
    CFTimeInterval timeOffset = self.doorLayer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset - x));
    self.doorLayer.timeOffset = timeOffset;
    [gesture setTranslation:CGPointZero inView:self.view];
}



@end
