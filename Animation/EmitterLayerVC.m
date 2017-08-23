//
//  EmitterLayerVC.m
//  Animation
//
//  Created by WJ on 2017/8/23.
//  Copyright © 2017年 WJ. All rights reserved.
//  火焰爆炸效果

#import "EmitterLayerVC.h"

@interface EmitterLayerVC ()

@end

@implementation EmitterLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.view.bounds;
    [self.view.layer addSublayer:emitter];
    
    //  控制粒子图片是如何混合
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"02.png"].CGImage);
    
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    
    // 透明度每秒减小 0.4
    cell.alphaSpeed = -0.4;
    // 速度
    cell.velocity = 50;
    cell.velocityRange = 50;
    // 粒子的变化范围  2PI 为粒子可以在360度任意位置反射出来
    cell.emissionRange = M_PI * 2;
    emitter.emitterCells = @[cell];
}


@end
