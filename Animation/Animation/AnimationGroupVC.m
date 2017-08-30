//
//  AnimationGroupVC.m
//  Animation
//
//  Created by WJ on 2017/8/25.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "AnimationGroupVC.h"

@interface AnimationGroupVC ()

@property (nonatomic, strong) NSArray *arrImages;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSInteger index;

@end

@implementation AnimationGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self doubleAnimation];
    
//    [self transtion];
    
    [self createbutton];
    
}

- (void)createbutton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(150, 200, 80, 30);
    [button setTitle:@"Perform transition" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor purpleColor]];
    [button addTarget:self action:@selector(performTransition) forControlEvents:UIControlEventTouchUpInside];
}

// 截屏 旋转 动画
- (void)performTransition{
    
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    UIView *coverView = [[UIImageView alloc] initWithImage:coverImage];
    coverView.frame = self.view.bounds;
    
    [self.view addSubview:coverView];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        CGAffineTransform transform = CGAffineTransformMakeScale(0.01, 0.01);
        transform = CGAffineTransformRotate(transform, M_PI_2);
        coverView.transform = transform;
        coverView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [coverView removeFromSuperview];
    }];
    
}


// 实现淡入淡出效果
- (void)transtion{
    
    self.index = 0;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(150, 200, 80, 30);
    [button setTitle:@"更换图片" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor purpleColor]];
    [button addTarget:self action:@selector(changeImage) forControlEvents:UIControlEventTouchUpInside];
    
    self.arrImages = @[@"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", @"11.jpg"];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    [self.view addSubview:self.imageView];
    [self.imageView setImage:[UIImage imageNamed:self.arrImages[self.index]]];
    
}

// 改变imageview的图片
- (void)changeImage{
    
    self.index++;
    
//    // 设置淡入淡出的效果
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionFade;
//    transition.duration = 2.0;
//    [self.imageView.layer addAnimation:transition forKey:nil];   
//    self.index = self.index % self.arrImages.count;
//    [self.imageView setImage:[UIImage imageNamed:self.arrImages[self.index]]];
    
    
    self.index = self.index % self.arrImages.count;
    [UIView transitionWithView:self.imageView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
        self.imageView.image = [UIImage imageNamed:self.arrImages[self.index]];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

// 动画组 存放两个动画
- (void)doubleAnimation{
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
