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
    self.doorLayer.contents = [UIImage imageNamed:@"door.jpg"];
    [self.view.layer addSublayer:self.doorLayer];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -0.1/ 500.0;
    self.view.layer.sublayerTransform = perspective;
    
    
    
}



@end
