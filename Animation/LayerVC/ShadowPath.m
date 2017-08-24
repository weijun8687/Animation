//
//  ShadowPath.m
//  Animation
//
//  Created by WJ on 16/11/22.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ShadowPath.h"

@interface ShadowPath ()

@property (nonatomic, strong) UIImageView *v1;
@property (nonatomic, strong) UIImageView *v2;

@end

@implementation ShadowPath

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.v1 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 60, 60)];
    [self.view addSubview:self.v1];
//    self.v1.backgroundColor = [UIColor whiteColor];
    [self.v1 setImage:[UIImage imageNamed:@"图片"]];
    
    self.v2 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 140, 60, 60)];
    [self.view addSubview:self.v2];
    //    self.v1.backgroundColor = [UIColor whiteColor];
    [self.v2 setImage:[UIImage imageNamed:@"图片"]];
    
    self.v1.layer.shadowOpacity = 0.5;
    self.v2.layer.shadowOpacity = 0.5;

    
    // 创建一个正方形的阴影
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.v1.bounds);
    self.v1.layer.shadowPath = squarePath;
    // 设置完之后需要释放掉
    CGPathRelease(squarePath);
    
    // 创建一个圆形的阴影
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.v2.bounds);
    self.v2.layer.shadowPath = circlePath;
    // 设置完之后需要释放掉
    CGPathRelease(circlePath);
    
    
    

}



@end
