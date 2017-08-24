//
//  TransformViewController.m
//  Animation
//
//  Created by WJ on 2017/8/15.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"图片"]];
    [self.view addSubview:iv];
    iv.frame = CGRectMake(40, 80, 60, 60);
    
    // 组合操作
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    // 平移
    transform = CGAffineTransformTranslate(transform, 200, 0);
    // 先旋转30度
    transform = CGAffineTransformRotate(transform, M_PI /180.0 * 30.0);
    // 缩放
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    
    // 注: 先平移后缩放 和先缩放后平移的效果是不一样的
    
    // 下面两句的效果是一样的
//    iv.layer.affineTransform = transform;
    iv.transform = transform;
    
    
}


@end
