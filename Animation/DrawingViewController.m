//
//  DrawingViewController.m
//  Animation
//
//  Created by WJ on 2017/8/22.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "DrawingViewController.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawPerson];
    
    [self drawRect];
}

// 画含有一个直角的长方形
- (void)drawRect{
    CGRect rect = CGRectMake(150, 250, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corner = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radii];
//    path.lineWidth = 3.0;
//    
//    // 路径的终点形状
//    // kCGLineCapButt:方形结束, 结束位置正好为精确位置
//    // kCGLineCapRound(圆形结束, 结束位置超过精确位置半个线宽)
//    // kCGLineCapSquare(方形结束, 结束位置超过精确位置半个线宽)
//    path.lineCapStyle = kCGLineCapButt;
//    
//    // 路径的起点形状
//    // kCGLineJoinMiter(全部连接) kCGLineJoinRound: 圆形连接 kCGLineJoinBevel:斜角连接
//    path.lineJoinStyle = kCGLineJoinMiter;
//    [[UIColor blueColor] setStroke];
//    [[UIColor orangeColor] setFill];
//    [path fill];
//    
//    [path stroke];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 3.0;
    layer.fillColor = [UIColor orangeColor].CGColor;
    layer.strokeColor = [UIColor blueColor].CGColor;
    layer.lineJoin = kCALineJoinMiter;
    layer.lineCap = kCALineCapRound;
    layer.path = path.CGPath;
    [self.view.layer addSublayer:layer];
    
}

// 画小人
- (void)drawPerson{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    
    // startAngle 起始的弧度 endAngle:结束的弧度  clockwise 是否为顺时针
    // angle: 0代表圆的最右边 0.5代表圆的最下面 1代表圆的最左边 1.5代表圆的最上面
    // 左边的圆
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    // 右边的圆
    //    [path addArcWithCenter:CGPointMake(200, 100) radius:25 startAngle:-M_PI endAngle:M_PI clockwise:YES];
    
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(125, 150)];
    [path addLineToPoint:CGPointMake(175, 150)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    // 笔画的颜色
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    //填充颜色
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    // 线宽
    shapeLayer.lineWidth = 4;
    // 线条之间结合点的样子
    shapeLayer.lineJoin = kCALineJoinRound;
    // 线条结尾的样子
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];

}

@end
