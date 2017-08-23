//
//  ReplicatorLayerVC.m
//  Animation
//
//  Created by WJ on 2017/8/23.
//  Copyright © 2017年 WJ. All rights reserved.
//  重复图层的复用

#import "ReplicatorLayerVC.h"

@interface ReplicatorLayerVC ()

@end

@implementation ReplicatorLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
    [self.view.layer addSublayer:replicatorLayer];
    
    // 复用的锚点是 replicatorLayer 的中心点
    // 设置重复的数量
    replicatorLayer.instanceCount = 10;
    // 每次旋转的角度都是相对于上一个layer
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    replicatorLayer.instanceTransform = transform;
    
    // 改变颜色
    replicatorLayer.instanceBlueOffset = -0.1;
    replicatorLayer.instanceGreenOffset = -0.1;
    
    CALayer *layer = [CALayer new];
    layer.frame = CGRectMake(self.view.bounds.size.width / 2.0 - 50, 140, 100, 100);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:layer];
    
    
}


@end
