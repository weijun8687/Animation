//
//  TransactionVC.m
//  Animation
//
//  Created by WJ on 2017/8/24.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "TransactionVC.h"

@interface TransactionVC ()

@property (nonatomic, strong)UIView *layerView;
@property (nonatomic, strong)CALayer *colorLayer;
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)UIButton *btn2;

@end

@implementation TransactionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layerView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.layerView];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    self.colorLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(80, 200, 100, 20);
    [self.layerView addSubview:self.button];
    self.button.backgroundColor = [UIColor purpleColor];
    [self.button setTitle:@"layer背景" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn2.frame = CGRectMake(80, 300, 100, 20);
    [self.layerView addSubview:self.btn2];
    self.btn2.backgroundColor = [UIColor blueColor];
    [self.btn2 setTitle:@"view背景" forState:UIControlStateNormal];
    [self.btn2 addTarget:self action:@selector(changeViewLayerBackgroundColor) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeViewLayerBackgroundColor{
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    self.layerView.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];

}


// 变色(1s)完成之后 再旋转 (0.25s)
- (void)changeColor{
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    
    // 禁用动画
//    [CATransaction setDisableActions:YES];
    
    
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
}



@end
